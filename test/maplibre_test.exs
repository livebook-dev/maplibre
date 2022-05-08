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
end
