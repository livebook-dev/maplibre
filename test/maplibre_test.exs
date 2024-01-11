defmodule MapLibreTest do
  use ExUnit.Case

  alias MapLibre, as: Ml

  @maptiler_key "Q4UbchekCfyvXvZcWRoU"

  describe "new/1" do
    test "returns the initial default style" do
      ml = Ml.new() |> Ml.to_spec()
      expected = MapLibre.Styles.style(:default, @maptiler_key)
      assert ml == expected
    end

    test "put the given options as properties into the style" do
      ml = Ml.new(center: {-74.5, 40}, zoom: 3)
      assert ml.spec["name"] == "MapLibre"
      assert ml.spec["center"] == [-74.5, 40]
      assert ml.spec["zoom"] == 3
    end

    test "loads a built-in style" do
      ml = Ml.new(style: :street) |> Ml.to_spec()
      expected = MapLibre.Styles.style(:street, @maptiler_key)
      assert ml == expected
    end

    test "loads a built-in style with external key" do
      ml = Ml.new(style: :street, key: "123456") |> Ml.to_spec()
      expected = MapLibre.Styles.style(:street, "123456")
      assert ml == expected
    end

    test "put the given options as properties into a custom style" do
      ml = Ml.new(style: :terrain, center: {-74.5, 40}, zoom: 3)
      assert ml.spec["name"] == "Satellite Hybrid"
      assert ml.spec["center"] == [-74.5, 40]
      assert ml.spec["zoom"] == 3
    end

    test "raises an error when invalid options are given" do
      assert_raise ArgumentError,
                   "unknown option, expected one of :bearing, :center, :name, :pitch, :zoom, :style, got: :invalid",
                   fn ->
                     Ml.new(invalid: true)
                   end
    end

    test "returns an empty style" do
      ml = Ml.new(style: %{})
      assert ml == %MapLibre{spec: %{"version" => 8}}
    end
  end

  describe "add_source/3" do
    test "raises an error when no source type is given" do
      assert_raise ArgumentError, "source type is required", fn ->
        Ml.new() |> Ml.add_source("invalid", [])
      end
    end

    test "raises an error when an invalid source type is given" do
      assert_raise ArgumentError,
                   "unknown source type, expected one of :vector, :raster, :raster_dem, :geojson, :image, :video, got: :invalid",
                   fn ->
                     Ml.new() |> Ml.add_source("invalid", type: :invalid)
                   end
    end

    test "raises an error if a geojson with no data is given" do
      assert_raise ArgumentError,
                   ~s(The GeoJSON data must be given using the "data" property, whose value can be a URL or inline GeoJSON.),
                   fn ->
                     Ml.new() |> Ml.add_source("invalid", type: :geojson)
                   end
    end

    test "raises an error if a geojson with empty data is given" do
      assert_raise ArgumentError,
                   ~s(The GeoJSON data must be given using the "data" property, whose value can be a URL or inline GeoJSON.),
                   fn ->
                     Ml.new() |> Ml.add_source("invalid", type: :geojson, data: [])
                   end
    end

    test "adds a new source to the map" do
      ml =
        Ml.new()
        |> Ml.add_source("urban-areas",
          type: :geojson,
          data:
            "https://d2ad6b4ur7yvpq.cloudfront.net/naturalearth-3.3.0/ne_50m_urban_areas.geojson"
        )

      source = ml.spec["sources"]["urban-areas"]
      assert source["type"] == "geojson"
    end

    test "adds the first source to an empty style" do
      ml =
        Ml.new(style: %{})
        |> Ml.add_source("urban-areas",
          type: :geojson,
          data:
            "https://d2ad6b4ur7yvpq.cloudfront.net/naturalearth-3.3.0/ne_50m_urban_areas.geojson"
        )

      source = ml.spec["sources"]["urban-areas"]
      assert source["type"] == "geojson"
    end
  end

  describe "add_geo_source/3" do
    test "adds a Geo geometry as source to the map" do
      geom = %Geo.LineString{
        coordinates: [
          {-122.48369693756104, 37.83381888486939},
          {-122.48348236083984, 37.83317489144141}
        ]
      }

      ml = Ml.new() |> Ml.add_geo_source("route", geom)

      source = ml.spec["sources"]["route"]
      assert source["type"] == "geojson"
    end

    test "adds a Geo polygon as source to the map" do
      geom = %Geo.Polygon{
        coordinates: [
          [
            {-67.13734351262877, 45.137451890638886},
            {-66.96466, 44.8097},
            {-68.03252, 44.3252},
            {-69.06, 43.98}
          ]
        ]
      }

      ml = Ml.new() |> Ml.add_geo_source("maine", geom)

      source = ml.spec["sources"]["maine"]
      assert source["type"] == "geojson"
    end

    test "adds a Geo collection as source to the map" do
      p1 = %Geo.Point{coordinates: {-121.415061, 40.506229}}
      p2 = %Geo.Point{coordinates: {-121.505184, 40.488084}}
      p3 = %Geo.Point{coordinates: {-121.354465, 40.488737}}

      pl = %Geo.Polygon{
        coordinates: [
          [
            {-121.353637, 40.584978},
            {-121.284551, 40.584758},
            {-121.275349, 40.541646}
          ]
        ]
      }

      gc = %Geo.GeometryCollection{geometries: [p1, p2, p3, pl]}

      ml = Ml.new() |> Ml.add_geo_source("national-park", gc)

      source = ml.spec["sources"]["national-park"]
      assert source["type"] == "geojson"
    end
  end

  describe "add_table_source/5" do
    test "adds tabular data as source to the map" do
      earthquakes = %{
        "latitude" => [32.3646, 32.3357, -9.0665, 52.0779, -57.7326],
        "longitude" => [101.8781, 101.8413, -71.2103, 178.2851, 148.6945],
        "mag" => [5.9, 5.6, 6.5, 6.3, 6.4]
      }

      ml =
        Ml.new()
        |> Ml.add_table_source("earthquakes", earthquakes, {:lat_lng, ["latitude", "longitude"]})

      source = ml.spec["sources"]["earthquakes"]
      assert source["type"] == "geojson"

      assert List.first(source["data"]["features"]) == %{
               "geometry" => %{"coordinates" => [101.8781, 32.3646], "type" => "Point"},
               "properties" => %{},
               "type" => "Feature"
             }
    end

    test "adds tabular data as source to the map with properties" do
      earthquakes = %{
        "latitude" => [32.3646, 32.3357, -9.0665, 52.0779, -57.7326],
        "longitude" => [101.8781, 101.8413, -71.2103, 178.2851, 148.6945],
        "mag" => [5.9, 5.6, 6.5, 6.3, 6.4]
      }

      ml =
        Ml.new()
        |> Ml.add_table_source(
          "earthquakes",
          earthquakes,
          {:lat_lng, ["latitude", "longitude"]},
          properties: ["mag"]
        )

      source = ml.spec["sources"]["earthquakes"]
      assert source["type"] == "geojson"

      assert List.first(source["data"]["features"]) == %{
               "geometry" => %{"coordinates" => [101.8781, 32.3646], "type" => "Point"},
               "properties" => %{"mag" => 5.9},
               "type" => "Feature"
             }
    end

    test "raises an error when the coordinates specification is not valid" do
      columns = %{
        "latitude" => [32.3646, 32.3357, -9.0665, 52.0779, -57.7326],
        "longitude" => [101.8781, 101.8413, -71.2103, 178.2851, 148.6945],
        "mag" => [5.9, 5.6, 6.5, 6.3, 6.4]
      }

      combined = %{
        "coordinates" => ["32.3646, 101.8781", "32.3357, 101.8413", "-9.0665, -71.2103"],
        "mag" => [5.9, 5.6, 6.5]
      }

      assert_raise ArgumentError,
                   "unsupported coordinates format. Expects a tuple of two elements, the first being the format (:lng_lat or :lat_lng) and the second being the column or the list of the two columns containing the coordinates",
                   fn ->
                     Ml.new() |> Ml.add_table_source("invalid", columns, {:lng_lat, ["invalid"]})
                   end

      assert_raise ArgumentError,
                   "unsupported coordinates format. Expects a tuple of two elements, the first being the format (:lng_lat or :lat_lng) and the second being the column or the list of the two columns containing the coordinates",
                   fn ->
                     Ml.new()
                     |> Ml.add_table_source(
                       "invalid",
                       columns,
                       {:lns_lat, ["latitude", "longitude"]}
                     )
                   end

      assert_raise ArgumentError,
                   "unsupported coordinates format. Expects a tuple of two elements, the first being the format (:lng_lat or :lat_lng) and the second being the column or the list of the two columns containing the coordinates",
                   fn ->
                     Ml.new()
                     |> Ml.add_table_source("invalid", combined, {:lns_lat, "coordinates"})
                   end

      assert_raise ArgumentError,
                   "unsupported coordinates format. Expects a tuple of two elements, the first being the format (:lng_lat or :lat_lng) and the second being the column or the list of the two columns containing the coordinates",
                   fn ->
                     Ml.new() |> Ml.add_table_source("invalid", combined, {:lng_lat})
                   end
    end

    test "raises an error when the coordinates data are not valid" do
      invalid = %{
        "coordinates" => ["invalid", "32.3357, 101.8413", "-9.0665, -71.2103"],
        "mag" => [5.9, 5.6, 6.5]
      }

      missing_lat = %{
        "coordinates" => ["32.3646", "32.3357, 101.8413", "-9.0665, -71.2103"],
        "mag" => [5.9, 5.6, 6.5]
      }

      assert_raise ArgumentError,
                   "unsupported coordinates data, expected it two contain two numbers separated by comma (,), colon (;) or space",
                   fn ->
                     Ml.new()
                     |> Ml.add_table_source("invalid", invalid, {:lng_lat, "coordinates"})
                   end

      assert_raise ArgumentError,
                   "unsupported coordinates data, expected it two contain two numbers separated by comma (,), colon (;) or space",
                   fn ->
                     Ml.new()
                     |> Ml.add_table_source("invalid", missing_lat, {:lng_lat, "coordinates"})
                   end
    end

    test "raises an error when a missing column is provided" do
      invalid = %{
        "coordinates" => ["32.3646, 101.8781", "32.3357, 101.8413", "-9.0665, -71.2103"],
        "mag" => [5.9, 5.6, 6.5]
      }

      assert_raise ArgumentError, ~s(column "invalid" was not found), fn ->
        Ml.new() |> Ml.add_table_source("invalid", invalid, {:lng_lat, "invalid"})
      end

      assert_raise ArgumentError, ~s(column "invalid" was not found), fn ->
        Ml.new()
        |> Ml.add_table_source("invalid", invalid, {:lng_lat, "coordinates"},
          properties: ["invalid"]
        )
      end
    end
  end

  describe "add_geocode_source/3" do
    test "adds a new source to the map by a given name" do
      ml =
        Ml.new()
        |> Ml.add_geocode_source("brazil", "brazil")

      source = ml.spec["sources"]["brazil"]
      assert source["type"] == "geojson"

      assert source["data"] ==
               "https://nominatim.openstreetmap.org/search?format=geojson&limit=1&polygon_geojson=1&q=brazil"
    end

    test "adds a new source to the map by a given address" do
      ml =
        Ml.new()
        |> Ml.add_geocode_source("pilkington-avenue", "pilkington avenue, birmingham")

      source = ml.spec["sources"]["pilkington-avenue"]
      assert source["type"] == "geojson"

      assert source["data"] ==
               "https://nominatim.openstreetmap.org/search?format=geojson&limit=1&polygon_geojson=1&q=pilkington+avenue,+birmingham"
    end
  end

  describe "add_geocode_source/4" do
    test "raises an error when an invalid geocode type is given" do
      assert_raise ArgumentError,
                   "unknown geocode type, expected one of :street, :city, :county, :state, :country, :postalcode, got: :invalid",
                   fn ->
                     Ml.new() |> Ml.add_geocode_source("invalid", "invalid", :invalid)
                   end
    end

    test "adds a new source to the map by a given state" do
      ml =
        Ml.new()
        |> Ml.add_geocode_source("ny", "new york", :state)

      source = ml.spec["sources"]["ny"]
      assert source["type"] == "geojson"

      assert source["data"] ==
               "https://nominatim.openstreetmap.org/search?format=geojson&limit=1&polygon_geojson=1&state=new york"
    end

    test "adds a new source to the map by a given city" do
      ml =
        Ml.new()
        |> Ml.add_geocode_source("new-york", "new york", :city)

      source = ml.spec["sources"]["new-york"]
      assert source["type"] == "geojson"

      assert source["data"] ==
               "https://nominatim.openstreetmap.org/search?format=geojson&limit=1&polygon_geojson=1&city=new york"
    end
  end

  describe "add_layer/2" do
    test "raises an error when no layer id is given" do
      assert_raise ArgumentError, "layer id is required", fn ->
        Ml.new() |> Ml.add_layer(type: :fill)
      end
    end

    test "raises an error if the layer already exists" do
      assert_raise ArgumentError,
                   ~s(The "background" layer already exists on the map. If you want to update a layer, use the "update_layer/3" function instead),
                   fn ->
                     Ml.new() |> Ml.add_layer(id: "background")
                   end
    end

    test "raises an error when no layer type is given" do
      assert_raise ArgumentError, "layer type is required", fn ->
        Ml.new() |> Ml.add_layer(id: "invalid")
      end
    end

    test "raises an error when an invalid layer type is given" do
      assert_raise ArgumentError,
                   "unknown layer type, expected one of :background, :fill, :line, :symbol, :raster, :circle, :fill_extrusion, :heatmap, :hillshade, got: :invalid",
                   fn ->
                     Ml.new() |> Ml.add_layer(id: "invalid", type: :invalid)
                   end
    end

    test "raises an error when the layer refers to a source that doesn't exist" do
      assert_raise ArgumentError,
                   ~s(source "invalid" was not found. The source must be present in the style before it can be associated with a layer. Current available sources are: "crimea", "maplibre"),
                   fn ->
                     Ml.new() |> Ml.add_layer(id: "invalid", type: :fill, source: "invalid")
                   end
    end

    test "adds a new layer into the map" do
      ml = Ml.new() |> Ml.add_layer(id: "maplibre", type: :fill, source: "maplibre")
      layer = Enum.find(ml.spec["layers"], &(&1["id"] == "maplibre"))
      assert layer["type"] == "fill"
      assert layer["source"] == "maplibre"
    end

    test "adds the first layer to an empty style" do
      ml = Ml.new(style: %{}) |> Ml.add_layer(id: "background", type: :background)
      assert ml.spec["layers"] == [%{"id" => "background", "type" => "background"}]
    end
  end

  describe "add_layer_below_labels/2" do
    test "raises an error when no layer type is given" do
      assert_raise ArgumentError, "layer type is required", fn ->
        Ml.new() |> Ml.add_layer_below_labels(id: "invalid")
      end
    end

    test "raises an error when an invalid layer type is given" do
      assert_raise ArgumentError,
                   "unknown layer type, expected one of :background, :fill, :line, :symbol, :raster, :circle, :fill_extrusion, :heatmap, :hillshade, got: :invalid",
                   fn ->
                     Ml.new() |> Ml.add_layer_below_labels(id: "invalid", type: :invalid)
                   end
    end

    test "raises an error when the layer refers to a source that doesn't exist" do
      assert_raise ArgumentError,
                   ~s(source "invalid" was not found. The source must be present in the style before it can be associated with a layer. Current available sources are: "crimea", "maplibre"),
                   fn ->
                     Ml.new()
                     |> Ml.add_layer_below_labels(id: "invalid", type: :fill, source: "invalid")
                   end
    end

    test "adds a new layer bellow the labels" do
      ml = Ml.new() |> Ml.add_layer_below_labels(id: "maplibre", type: :fill, source: "maplibre")
      first_labels_index = Enum.find_index(ml.spec["layers"], &(&1["type"] == "symbol"))
      layer_index = Enum.find_index(ml.spec["layers"], &(&1["id"] == "maplibre"))
      assert layer_index == first_labels_index - 1
    end
  end

  describe "update_layer/3" do
    test "updates a given layer" do
      ml =
        Ml.new()
        |> Ml.add_layer(id: "maplibre", type: :line, source: "maplibre")
        |> Ml.update_layer("maplibre", type: :fill, paint: [fill_color: "red"])

      layer = Enum.find(ml.spec["layers"], &(&1["id"] == "maplibre"))
      assert layer["type"] == "fill"
      assert layer["source"] == "maplibre"
      assert layer["paint"] == %{"fill-color" => "red"}
    end

    test "raises an error if the given layer doesn't exist" do
      assert_raise ArgumentError,
                   ~s(layer "invalid" was not found. Current available layers are: "background", "coastline", "countries-fill", "countries-boundary", "geolines", "geolines-label", "countries-label", "crimea-fill"),
                   fn ->
                     Ml.new() |> Ml.update_layer("invalid", type: :fill)
                   end
    end

    test "raises an error if updated to an invalid type" do
      assert_raise ArgumentError,
                   "unknown layer type, expected one of :background, :fill, :line, :symbol, :raster, :circle, :fill_extrusion, :heatmap, :hillshade, got: :invalid",
                   fn -> Ml.new() |> Ml.update_layer("coastline", type: :invalid) end
    end

    test "raises an error if updated to an invalid source" do
      assert_raise ArgumentError,
                   ~s(source "invalid" was not found. The source must be present in the style before it can be associated with a layer. Current available sources are: "crimea", "maplibre"),
                   fn ->
                     Ml.new() |> Ml.update_layer("coastline", type: :fill, source: "invalid")
                   end
    end
  end

  test "light/2" do
    ml = Ml.new() |> Ml.light(color: "red")
    assert ml.spec["light"] == %{"color" => "red"}
  end

  test "sprite/2" do
    sprite = "https://api.maptiler.com/maps/streets/sprite"
    ml = Ml.new() |> Ml.sprite(sprite)

    assert ml.spec["sprite"] == sprite
  end

  test "glyphs/2" do
    glyphs = "https://demotiles.maplibre.org/font/{fontstack}/{range}.pbf"
    ml = Ml.new() |> Ml.glyphs(glyphs)

    assert ml.spec["glyphs"] == glyphs
  end

  test "transition/2" do
    ml = Ml.new() |> Ml.transition(duration: 300, delay: 0)
    assert ml.spec["transition"] == %{"duration" => 300, "delay" => 0}
  end

  describe "metadata/3" do
    test "adds metadata" do
      ml = Ml.new() |> Ml.metadata("meta:data", "example")
      assert ml.spec["metadata"]["meta:data"] == "example"
    end

    test "updates metadata" do
      ml = Ml.new() |> Ml.metadata("meta:data", "example") |> Ml.metadata("meta:data", "updated")

      assert ml.spec["metadata"]["meta:data"] == "updated"
    end
  end

  describe "terrain/2" do
    test "add a terrain to the map" do
      ml =
        Ml.new(style: %{})
        |> Ml.add_source("terrain",
          type: :raster_dem,
          url: "https://demotiles.maplibre.org/terrain-tiles/tiles.json"
        )
        |> Ml.terrain(source: "terrain")

      assert ml.spec["terrain"] == %{"source" => "terrain"}
    end

    test "raises an error if the terrain source does not exist" do
      assert_raise ArgumentError,
                   ~s(source "invalid" was not found. The source must be present in the style before it can be associated with a terrain. Current available sources are: "crimea", "maplibre"),
                   fn ->
                     Ml.new() |> Ml.terrain(source: "invalid")
                   end
    end

    test "raises an error if the terrain source is not given" do
      assert_raise ArgumentError, "terrain source is required", fn ->
        Ml.new() |> Ml.terrain(exaggeration: 1)
      end
    end
  end
end
