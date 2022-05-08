defmodule MapLibreTest do
  use ExUnit.Case

  alias MapLibre, as: Ml

  describe "new/1" do
    test "returns the initial default style" do
      ml = Ml.new() |> Ml.to_spec()
      expected = Req.get!("https://demotiles.maplibre.org/style.json").body()
      assert ml == expected
    end

    test "put the given options as properties into the style" do
      ml = Ml.new(center: {-74.5, 40}, zoom: 3)
      assert ml.spec["name"] == "MapLibre"
      assert ml.spec["center"] == [-74.5, 40]
      assert ml.spec["zoom"] == 3
    end

    test "loads a custom style" do
      street_style =
        "https://api.maptiler.com/maps/streets/style.json?key=get_your_own_OpIi9ZULNHzrESv6T2vL"

      ml = Ml.new(style: street_style) |> Ml.to_spec()
      expected = Req.get!(street_style).body()
      assert ml == expected
    end

    test "put the given options as properties into a custom style" do
      terrain_style =
        "https://api.maptiler.com/maps/hybrid/style.json?key=get_your_own_OpIi9ZULNHzrESv6T2vL"

      ml = Ml.new(style: terrain_style, center: {-74.5, 40}, zoom: 3)
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
        Ml.new() |> Ml.add_source("invalid")
      end
    end

    test "raises an error when an invalid source type is given" do
      assert_raise ArgumentError,
                   "unknown source type, expected one of :vector, :raster, :raster_dem, :geojson, :image, :video, got: :invalid",
                   fn ->
                     Ml.new() |> Ml.add_source("invalid", type: :invalid)
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
      assert source
      assert source["type"] == "geojson"
    end
  end

  describe "add_layer/2" do
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
                   ~s(source "invalid" was not found. The source must be present in the style before it can be associated with a layer. Current available sources are: "maplibre"),
                   fn ->
                     Ml.new() |> Ml.add_layer(id: "invalid", type: :fill, source: "invalid")
                   end
    end

    test "adds a new layer into the map" do
      ml = Ml.new() |> Ml.add_layer(id: "maplibre", type: :fill, source: "maplibre")
      layer = Enum.find(ml.spec["layers"], &(&1["id"] == "maplibre"))
      assert layer
      assert layer["type"] == "fill"
      assert layer["source"] == "maplibre"
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
                   ~s(source "invalid" was not found. The source must be present in the style before it can be associated with a layer. Current available sources are: "maplibre"),
                   fn ->
                     Ml.new()
                     |> Ml.add_layer_below_labels(id: "invalid", type: :fill, source: "invalid")
                   end
    end

    test "adds a new layer bellow the labels" do
      ml = Ml.new() |> Ml.add_layer_below_labels(id: "maplibre", type: :fill, source: "maplibre")
      first_labels_index = Enum.find_index(ml.spec["layers"], &(&1["type"] == "symbol"))
      layer_index = Enum.find_index(ml.spec["layers"], &(&1["id"] == "maplibre"))
      assert layer_index
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
  end
end
