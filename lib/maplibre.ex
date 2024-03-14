defmodule MapLibre do
  @moduledoc """
  Elixir bindings to [MapLibre Style
  Specification](https://maplibre.org/maplibre-style-spec/).

  A MapLibre style is a document that defines the visual appearance of a map: what data to draw,
  the order to draw it in, and how to style the data when drawing it. A style document is a JSON
  object with specific root level and nested properties. To learn more about the style
  specification and its properties, please see the
  [documentation](https://maplibre.org/maplibre-style-spec/)

  ## Composing maps

  Laying out a basic MapLibre map consists of the following steps:

      alias MapLibre, as: Ml

      # Initialize the specification with the initial style and optionally some other root properties.
      # If you don't provide a initial style, the default style will be loaded for you
      Ml.new(center: {-74.5, 40}, zoom: 6)

      # Add sources to make their data available
      |> Ml.add_source("rwanda-provinces",
          type: :geojson,
          data: "https://maplibre.org/maplibre-gl-js/docs/assets/rwanda-provinces.geojson"
      )

      # Add layers and refer them to sources to define their visual representation and make them visible
      |> Ml.add_layer(id: "rwanda-provinces",
          type: :fill,
          source: "rwanda-provinces",
          paint: [fill_color: "#4A9661"]
      )

  ## Expressions

  Expressions are extremely powerful and useful to render complex data. To use them just ensure
  that you pass valid expressions following the rules and syntax of the [official
  documentation](https://maplibre.org/maplibre-style-spec/expressions/)

  ## Options

  To provide a more Elixir-friendly experience, the options are automatically normalized, so you
  can use keyword lists and snake-case atom keys.
  """

  alias MapLibre.Utils
  alias MapLibre.Styles

  @maptiler_key "Q4UbchekCfyvXvZcWRoU"
  @to_kebab Utils.kebab_case_properties()
  @geometries [Geo.Point, Geo.LineString, Geo.Polygon, Geo.GeometryCollection]
  @query_base "https://nominatim.openstreetmap.org/search?format=geojson&limit=1&polygon_geojson=1"

  defstruct spec: %{}

  @type t() :: %__MODULE__{spec: spec()}

  @type spec :: map()

  @type coordinates_format :: :lng_lat | :lat_lng

  @type coordinates_combined :: {coordinates_format(), column :: String.t()}

  @type coordinates_columns :: {coordinates_format(), columns :: nonempty_list(String.t())}

  @type coordinates_spec :: coordinates_combined() | coordinates_columns()

  @doc """
  Returns a style specification wrapped in the `MapLibre` struct. If you don't provide a initial
  style, the [default style](https://demotiles.maplibre.org/style.json) will be loaded for you. If
  you wish to build a new style completely from scratch, pass an empty map `%{}` as `:style`
  option. The style specification version will be automatically set to 8.

  ## Options

  Only the following properties are allowed directly on `new/1`

    * `:bearing` -  Default bearing, in degrees. The bearing is the compass direction that is
      "up"; for example, a bearing of 90° orients the map so that east is up. This value will be
      used only if the map has not been positioned by other means (e.g. map options or user
      interaction). Default: 0

    * `:center` - Default map center in longitude and latitude. The style center will be used only
      if the map has not been positioned by other means (e.g. map options or user interaction).
      Default: {0, 0}

    * `:name` - A human-readable name for the style.

    * `:pitch` - Default pitch, in degrees. Zero is perpendicular to the surface, for a look
      straight down at the map, while a greater value like 60 looks ahead towards the horizon. The
      style pitch will be used only if the map has not been positioned by other means (e.g. map
      options or user interaction). Default: 0

    * `:zoom` - Default zoom level. The style zoom will be used only if the map has not been
      positioned by other means (e.g. map options or user interaction).

    * `:style` - The initial style specification. Three built-in initial styles are available:
      `:default`, `:street` and `:terrain`.

    * `:key` - The [Maptiler](https://www.maptiler.com) key to be used by the built-in `:street`
      and `:terrain` styles. If you don't provide a key, the default key (strictly for
      non-commercial use) will be used.

  To manipulate any other [style root
  properties](https://maplibre.org/maplibre-style-spec/root/), use the
  corresponding functions

  ## Examples

      Ml.new(
        center: {-74.5, 40},
        zoom: 9,
        name: "Rwanda population density"
      )
      |> ...

  See [the docs](https://maplibre.org/maplibre-style-spec/) for more details.
  """
  @spec new(keyword()) :: t()
  def new(opts \\ []) do
    {key, opts} = Keyword.pop(opts, :key)
    key = if key, do: key, else: @maptiler_key
    validade_new_opts!(opts)
    style = opts |> Keyword.get(:style, :default) |> to_style(key)
    ml = %MapLibre{spec: style}
    ml_props = opts |> Keyword.delete(:style) |> opts_to_ml_props()
    update_in(ml.spec, fn spec -> Map.merge(spec, ml_props) end)
  end

  defp validade_new_opts!(opts) do
    new_options = [:bearing, :center, :name, :pitch, :zoom, :style]
    options = new_options |> Enum.map_join(", ", &inspect/1)

    for {option, _value} <- opts do
      if option not in new_options do
        raise ArgumentError,
              "unknown option, expected one of #{options}, got: #{inspect(option)}"
      end
    end
  end

  @doc """
  Returns the underlying MapLibre specification. The result is a nested Elixir data structure that
  serializes to MapLibre style JSON specification.

  See [the docs](https://maplibre.org/maplibre-style-spec/) for more details.
  """
  @spec to_spec(t()) :: spec()
  def to_spec(ml) do
    ml.spec
  end

  @doc """
  Adds a data source to the sources in the specification.

  Sources state which data the map should display. Specify the type of source with the `:type`
  property, which must be one of `:vector`, `:raster`, `:raster_dem`, `:geojson`, `:image` or `:video`.

  ## Examples

      Ml.new()
      |> Ml.add_source("rwanda-provinces",
            type: :geojson,
            data: "https://maplibre.org/maplibre-gl-js/docs/assets/rwanda-provinces.geojson"
      )

  See [the docs](https://maplibre.org/maplibre-style-spec/sources/) for more details.
  """
  @spec add_source(t(), String.t(), keyword()) :: t()
  def add_source(ml, source, opts) do
    validate_source!(opts)
    source = %{source => opts_to_ml_props(opts)}
    put_source(ml, source)
  end

  @doc """
  Adds a GEO data to the sources in the specification.

  For the `:geojson` type, provides integration with the [Geo](https://hexdocs.pm/geo/readme.html)
  package.

      geom = %Geo.LineString{coordinates: [
        {-122.48369693756104, 37.83381888486939},
        {-122.48348236083984, 37.83317489144141},
        {-122.48339653015138, 37.83270036637107}
      ]}

      Ml.new()
      |> Ml.add_geo_source("route", geom)
  """
  @spec add_geo_source(t(), String.t(), struct(), keyword()) :: t()
  def add_geo_source(ml, source, %module{} = geom, opts \\ []) when module in @geometries do
    data = Geo.JSON.encode!(geom, feature: true)
    source_props = opts_to_ml_props(opts) |> Map.merge(%{"type" => "geojson", "data" => data})
    source = %{source => source_props}
    put_source(ml, source)
  end

  @doc """
  Adds points from tabular data to the sources in the specification.

  For the `:geojson` type, provides integration with tabular data that implements the
  [Table](https://hexdocs.pm/table/Table.html) protocol.

  Supports data where the coordinates information is either in distinct columns or combined in a
  single one. In both cases you need to provide the pattern followed by the coordinates data:
  `:lng_lat` or `:lat_lng`

  Properties are also supported as a list of columns in the options.

      earthquakes = %{
        "latitude" => [32.3646, 32.3357, -9.0665, 52.0779, -57.7326],
        "longitude" => [101.8781, 101.8413, -71.2103, 178.2851, 148.6945],
        "mag" => [5.9, 5.6, 6.5, 6.3, 6.4]
      }

      Ml.new()
      |> Ml.add_table_source("earthquakes", earthquakes, {:lng_lat, ["longitude", "latitude"]})

      earthquakes = %{
        "coordinates" => ["32.3646, 101.8781", "32.3357, 101.8413", "-9.0665, -71.2103"],
        "mag" => [5.9, 5.6, 6.5]
      }

      Ml.new()
      |> Ml.add_table_source("earthquakes", earthquakes, {:lat_lng, "coordinates"}, properties: ["mag"])
  """
  @spec add_table_source(t(), String.t(), term(), coordinates_spec(), keyword()) :: t()
  def add_table_source(ml, source, data, coordinates, opts \\ []) do
    validate_coordinates!(coordinates)
    properties = Keyword.get(opts, :properties, [])
    data = geometry_from_table(data, coordinates, properties)

    source_props =
      opts
      |> Keyword.delete(:properties)
      |> opts_to_ml_props()
      |> Map.merge(%{"type" => "geojson", "data" => data})

    source = %{source => source_props}
    put_source(ml, source)
  end

  @doc """
  Adds a data source by a given geocode to the sources in the specification.

  For the `:geojson` type, provides integration with [Nominatim](https://nominatim.org).

  Any valid geocode is support in a free-form query string.

      Ml.new()
      |> Ml.add_geocode_source("brazil", "brazil")
      |> Ml.add_geocode_source("pilkington-avenue", "pilkington avenue, birmingham")
  """
  @spec add_geocode_source(t(), String.t(), String.t()) :: t()
  def add_geocode_source(ml, source, query) do
    query = String.replace(query, " ", "+")
    data = "#{@query_base}&q=#{query}"
    source = %{source => %{"type" => "geojson", "data" => data}}
    put_source(ml, source)
  end

  @doc """
  Same as `add_geocode_source/3` but for structured queries.

  The last argument is an atom for the geocode type.

  Supported types: `:street`, `:city`, `:county`, `:state`, `:country` and `:postalcode`

      Ml.new()
      |> Ml.add_geocode_source("new-york", "new york", :city)
      |> Ml.add_geocode_source("ny", "new york", :state)
  """
  @spec add_geocode_source(t(), String.t(), String.t(), atom()) :: t()
  def add_geocode_source(ml, source, query, type) do
    validate_geocode_type!(type)
    data = "#{@query_base}&#{type}=#{query}"
    source = %{source => %{"type" => "geojson", "data" => data}}
    put_source(ml, source)
  end

  defp validate_source!(opts) do
    type = opts[:type]

    validate_source_type!(type)
    if type == :geojson, do: validate_geojson!(opts)
  end

  defp validate_source_type!(nil) do
    raise ArgumentError,
          "source type is required"
  end

  defp validate_source_type!(type) do
    source_types = [:vector, :raster, :raster_dem, :geojson, :image, :video]

    if type not in source_types do
      types = source_types |> Enum.map_join(", ", &inspect/1)

      raise ArgumentError,
            "unknown source type, expected one of #{types}, got: #{inspect(type)}"
    end
  end

  defp validate_geojson!(opts) do
    data = opts[:data]

    if is_nil(data) || data == [] do
      raise ArgumentError,
            ~s(The GeoJSON data must be given using the "data" property, whose value can be a URL or inline GeoJSON.)
    end
  end

  defp validate_coordinates!(coordinates) do
    case coordinates do
      {format, column} when format in [:lng_lat, :lat_lng] and is_binary(column) ->
        nil

      {format, [lng, lat]}
      when format in [:lng_lat, :lat_lng] and is_binary(lng) and is_binary(lat) ->
        nil

      _ ->
        raise(
          ArgumentError,
          "unsupported coordinates format. Expects a tuple of two elements, the first being the format (:lng_lat or :lat_lng) and the second being the column or the list of the two columns containing the coordinates"
        )
    end
  end

  defp validate_geocode_type!(type) do
    geocode_types = [:street, :city, :county, :state, :country, :postalcode]

    if type not in geocode_types do
      types = geocode_types |> Enum.map_join(", ", &inspect/1)

      raise ArgumentError,
            "unknown geocode type, expected one of #{types}, got: #{inspect(type)}"
    end
  end

  @doc """
  Adds a layer to the layers list in the specification.

  A style's layers property lists all the layers available in the style. The type of layer is
  specified by the `:type` property, and must be one of `:background`, `:fill`, `:line`,
  `:symbol`, `:raster`, `:circle`, `:fill_extrusion`, `:heatmap`, `:hillshade`.

  Except for layers of the `:background` type, each layer needs to refer to a source. Layers take
  the data that they get from a source, optionally filter features, and then define how those
  features are styled.

  ## Required

    * `:id` - Unique layer name.

    * `:type` - One of:

      * `:fill` -  A filled polygon with an optional stroked border.
      * `:line` -  A stroked line.
      * `:symbol` - An icon or a text label.
      * `:circle` - A filled circle.
      * `:heatmap` - A heatmap.
      * `:fill_extrusion` - An extruded (3D) polygon.
      * `:raster` - Raster map textures such as satellite imagery.
      * `:hillshade` - Client-side hillshading visualization based on DEM data.
      * `:background` - The background color or pattern of the map.

    * `:source` - Name of a source description to be used for the layer. Required for all layer
      types except `:background`.

  ## Options

    * `:filter` - A expression specifying conditions on source features. Only features that match
      the filter are displayed.

    * `:layout` - Layout properties for the layer.

    * `:maxzoom` - Optional number between 0 and 24 inclusive. The maximum zoom level for the
      layer. At zoom levels equal to or greater than the `:maxzoom`, the layer will be hidden

    * `:metadata` - Arbitrary properties useful to track with the layer, but do not influence
      rendering. Properties should be prefixed to avoid collisions

    * `:minzoom` - Optional number between 0 and 24 inclusive. The minimum zoom level for the
      layer. At zoom levels less than the `:minzoom`, the layer will be hidden.

    * `:paint` - Default paint properties for this layer.

  ## Type specific

    * `:source_layer` - Layer to use from a vector tile source. Required for vector tile sources;
      prohibited for all other source types, including GeoJSON sources.

  ## Examples
      |> Ml.add_layer(id: "rwanda-provinces",
          type: :fill,
          source: "rwanda-provinces",
          paint: [fill_color: "#4A9661"]
      )

  See [the docs](https://maplibre.org/maplibre-style-spec/layers/) for more details.
  """
  @spec add_layer(t(), keyword()) :: t()
  def add_layer(ml, opts) do
    validade_layer!(ml, opts)
    layer = opts_to_ml_props(opts)
    layers = if ml.spec["layers"], do: List.insert_at(ml.spec["layers"], -1, layer), else: [layer]
    update_in(ml.spec, fn spec -> Map.put(spec, "layers", layers) end)
  end

  @doc """
  Same as `add_layer/2` but puts the given layer immediately below the labels
  """
  @spec add_layer_below_labels(t(), keyword()) :: t()
  def add_layer_below_labels(%_{spec: %{"layers" => layers}} = ml, opts) do
    validade_layer!(ml, opts)
    labels = Enum.find_index(layers, &(&1["type"] == "symbol"))
    layer = opts_to_ml_props(opts)
    updated_layers = List.insert_at(layers, labels, layer)
    update_in(ml.spec, fn spec -> Map.put(spec, "layers", updated_layers) end)
  end

  @doc """
  Updates a layer that was already defined in the specification
  """
  @spec update_layer(t(), String.t(), keyword()) :: t()
  def update_layer(%_{spec: %{"layers" => layers}} = ml, id, opts) do
    updated_fields = opts_to_ml_props(opts)
    index = Enum.find_index(layers, &(&1["id"] == id))
    validate_layer_update!(index, id, layers, ml, opts)
    updated_layer = layers |> Enum.at(index) |> Map.merge(updated_fields)
    updated_layers = List.replace_at(layers, index, updated_layer)
    update_in(ml.spec, fn spec -> Map.put(spec, "layers", updated_layers) end)
  end

  defp validade_layer!(ml, opts) do
    id = opts[:id]
    type = opts[:type]
    source = opts[:source]

    validate_layer_id!(ml, id)
    validate_layer_type!(type)
    if type != :background, do: validate_source!(ml, source, :layer)
  end

  defp validate_layer_update!(index, id, layers, ml, opts) do
    if index == nil do
      layers = Enum.map_join(layers, ", ", &inspect(&1["id"]))

      raise ArgumentError,
            "layer #{inspect(id)} was not found. Current available layers are: #{layers}"
    end

    type = opts[:type]
    source = opts[:source]
    if type, do: validate_layer_type!(type)
    if source, do: validate_source!(ml, source, :layer)
  end

  defp validate_layer_id!(_ml, nil) do
    raise ArgumentError,
          "layer id is required"
  end

  defp validate_layer_id!(ml, id) do
    if ml.spec["layers"] && Enum.find(ml.spec["layers"], &(&1["id"] == id)) do
      raise ArgumentError,
            "The #{inspect(id)} layer already exists on the map. If you want to update a layer, use the #{inspect("update_layer/3")} function instead"
    end
  end

  defp validate_layer_type!(nil) do
    raise ArgumentError,
          "layer type is required"
  end

  defp validate_layer_type!(type) do
    layer_types = [
      :background,
      :fill,
      :line,
      :symbol,
      :raster,
      :circle,
      :fill_extrusion,
      :heatmap,
      :hillshade
    ]

    if type not in layer_types do
      types = layer_types |> Enum.map_join(", ", &inspect/1)

      raise ArgumentError,
            "unknown layer type, expected one of #{types}, got: #{inspect(type)}"
    end
  end

  defp validate_source!(_ml, nil, type) do
    raise ArgumentError,
          "#{type} source is required"
  end

  defp validate_source!(ml, source, type) do
    if not Map.has_key?(ml.spec["sources"], source) do
      sources = Map.keys(ml.spec["sources"]) |> Enum.map_join(", ", &inspect/1)

      raise ArgumentError,
            "source #{inspect(source)} was not found. The source must be present in the style before it can be associated with a #{type}. Current available sources are: #{sources}"
    end
  end

  @doc """
  Sets the light options in the specification.

  A style's light property provides a global light source for that style. Since this property is
  the light used to light extruded features, you will only see visible changes to your map style
  when modifying this property if you are using extrusions.

  ## Options

    * `:anchor` - Whether extruded geometries are lit relative to the map or viewport. "map": The
      position of the light source is aligned to the rotation of the map. "viewport": The position
      of the light source is aligned to the rotation of the viewport. Default: "viewport"

    * `:color` - Color tint for lighting extruded geometries. Default: "#ffffff"

    * `:intensity` - Intensity of lighting (on a scale from 0 to 1). Higher numbers will present
      as more extreme contrast. Default: 0.5

    * `:position` - Position of the light source relative to lit (extruded) geometries, in {r
      radial coordinate, a azimuthal angle, p polar angle} where r indicates the distance from the
      center of the base of an object to its light, a indicates the position of the light relative
      to 0° (0° when light.anchor is set to viewport corresponds to the top of the viewport, or 0°
      when light.anchor is set to map corresponds to due north, and degrees proceed clockwise),
      and p indicates the height of the light (from 0°, directly above, to 180°, directly below).
      Default: {1.15, 210, 30}

  See [the docs](https://maplibre.org/maplibre-style-spec/light/) for more details.
  """
  @spec light(t(), keyword()) :: t()
  def light(ml, opts) do
    light = opts_to_ml_props(opts)
    update_in(ml.spec, fn spec -> Map.put(spec, "light", light) end)
  end

  @doc """
  Sets the sprite url in the specification.

  A style's sprite property supplies a URL template for loading small images to use in rendering
  `:background_pattern`, `:fill_pattern`, `:line_pattern`,`:fill_extrusion_pattern` and `:icon_image` style
  properties.

  See [the docs](https://maplibre.org/maplibre-style-spec/sprite/) for more details.
  """
  @spec sprite(t(), String.t()) :: t()
  def sprite(ml, sprite) when is_binary(sprite) do
    update_in(ml.spec, fn spec -> Map.put(spec, "sprite", sprite) end)
  end

  @doc """
  Sets the glyphs url in the specification.

  A style's glyphs property provides a URL template for loading signed-distance-field glyph sets
  in PBF format.

  See [the docs](https://maplibre.org/maplibre-style-spec/glyphs/) for more details.
  """
  @spec glyphs(t(), String.t()) :: t()
  def glyphs(ml, glyphs) when is_binary(glyphs) do
    update_in(ml.spec, fn spec -> Map.put(spec, "glyphs", glyphs) end)
  end

  @doc """
  Defines a global default transition settings in the specification.

  A transition property controls timing for the interpolation between a transitionable style
  property's previous value and new value. A style's root transition property provides global
  transition defaults for that style.

  See [the docs](https://maplibre.org/maplibre-style-spec/transition/) for more
  details.
  """
  @spec transition(t(), keyword()) :: t()
  def transition(ml, opts) do
    transition = opts_to_ml_props(opts)
    update_in(ml.spec, fn spec -> Map.put(spec, "transition", transition) end)
  end

  @doc """
  Add 3D terrain to the map.

  The source must have been previously added to the map.

  See [the docs](https://maplibre.org/maplibre-style-spec/terrain/) for more
  details.
  """
  @spec terrain(t(), keyword()) :: t()
  def terrain(ml, opts) do
    validate_source!(ml, opts[:source], :terrain)
    terrain = opts_to_ml_props(opts)
    update_in(ml.spec, fn spec -> Map.put(spec, "terrain", terrain) end)
  end

  @doc """
  Adds or updates the map metadata properties. Metadata are arbitrary properties useful to track
  with the style, but do not influence rendering. Properties should be prefixed to avoid
  collisions, like "mapbox:".
  """
  @spec metadata(t(), String.t(), String.t()) :: t()
  def metadata(ml, key, value) do
    metadata = %{key => value}
    current_metadata = if ml.spec["metadata"], do: ml.spec["metadata"], else: %{}
    updated_metadata = Map.merge(current_metadata, metadata)
    update_in(ml.spec, fn spec -> Map.put(spec, "metadata", updated_metadata) end)
  end

  # Helpers

  defp opts_to_ml_props(opts) do
    opts |> Map.new() |> to_ml()
  end

  defp to_ml(value) when value in [true, false, nil], do: value

  defp to_ml(atom) when is_atom(atom), do: to_ml_key(atom)

  defp to_ml(map) when is_map(map) do
    Map.new(map, fn {key, value} ->
      {to_ml(key), to_ml(value)}
    end)
  end

  defp to_ml([{key, _} | _] = keyword) when is_atom(key) do
    Map.new(keyword, fn {key, value} ->
      {to_ml(key), to_ml(value)}
    end)
  end

  defp to_ml(list) when is_list(list) do
    Enum.map(list, &to_ml/1)
  end

  defp to_ml(tuple) when is_tuple(tuple) do
    tuple |> Tuple.to_list() |> Enum.map(&to_ml/1)
  end

  defp to_ml(value), do: value

  defp to_ml_key(key) when is_atom(key) and key in @to_kebab do
    key |> to_string() |> snake_to_kebab()
  end

  defp to_ml_key(key) when is_atom(key) do
    key |> to_string() |> snake_to_camel()
  end

  defp snake_to_kebab(string) do
    String.replace(string, "_", "-")
  end

  defp snake_to_camel(string) do
    [part | parts] = String.split(string, "_")
    Enum.join([String.downcase(part, :ascii) | Enum.map(parts, &String.capitalize(&1, :ascii))])
  end

  @compile {:no_warn_undefined, {Req, :get!, 2}}

  defp to_style(style, _key) when style == %{}, do: %{"version" => 8}
  defp to_style(style, key) when is_atom(style), do: Styles.style(style, key)
  defp to_style(style, _key) when is_map(style), do: style

  defp to_style("http" <> _rest = style, _key) do
    Utils.assert_req!()
    Req.get!(style, http_errors: :raise).body
  end

  defp geometry_from_table(data, spec, []) do
    geometries =
      data
      |> points(spec)
      |> Enum.map(&%Geo.Point{coordinates: &1})

    Geo.JSON.encode!(%Geo.GeometryCollection{geometries: geometries}, feature: true)
  end

  defp geometry_from_table(data, spec, properties) do
    points = points(data, spec)
    properties = properties(data, properties)
    geometries = Enum.zip(points, properties)

    geometries =
      for {point, props} <- geometries, do: %Geo.Point{coordinates: point, properties: props}

    Geo.JSON.encode!(%Geo.GeometryCollection{geometries: geometries}, feature: true)
  end

  def points(data, {format, [lng, lat]}) do
    validate_columns!(data, [lng, lat])

    table = Table.to_columns(data, only: [lng, lat])
    Enum.zip_with(table[lng], table[lat], &parse_coordinates({&1, &2}, format))
  end

  def points(data, {format, coordinates}) do
    validate_columns!(data, [coordinates])

    data
    |> Table.to_columns(only: [coordinates])
    |> Map.get(coordinates)
    |> Enum.map(&parse_coordinates(&1, format))
  end

  defp properties(data, properties) do
    validate_columns!(data, properties)

    data
    |> Table.to_rows(only: properties)
    |> Enum.to_list()
  end

  defp parse_coordinates({lng, lat}, :lng_lat), do: {lng, lat}
  defp parse_coordinates({lng, lat}, :lat_lng), do: {lat, lng}

  defp parse_coordinates(coordinates, format) when is_binary(coordinates) do
    Regex.named_captures(~r/(?<lng>-?\d+\.?\d*)\s*[,;\s]\s*(?<lat>-?\d+\.?\d*)/, coordinates)
    |> case do
      %{"lat" => lat, "lng" => lng} ->
        if format == :lng_lat, do: {lng, lat}, else: {lat, lng}

      _ ->
        raise ArgumentError,
              "unsupported coordinates data, expected it two contain two numbers separated by comma (,), colon (;) or space"
    end
  end

  defp parse_coordinates(_, _) do
    raise ArgumentError,
          "unsupported coordinates data, expected it two contain two numbers separated by comma (,), colon (;) or space"
  end

  defp validate_columns!(data, columns) do
    data_columns = columns_for(data)
    missing_column = Enum.find(columns, &(&1 not in data_columns))

    if missing_column,
      do: raise(ArgumentError, "column #{inspect(missing_column)} was not found")
  end

  defp columns_for(data) do
    with {_, %{columns: columns}, _} <- Table.Reader.init(data) do
      for column <- columns do
        if is_atom(column), do: Atom.to_string(column), else: column
      end
    else
      _ -> nil
    end
  end

  defp put_source(ml, source) do
    sources = if ml.spec["sources"], do: Map.merge(ml.spec["sources"], source), else: source
    update_in(ml.spec, fn spec -> Map.put(spec, "sources", sources) end)
  end
end
