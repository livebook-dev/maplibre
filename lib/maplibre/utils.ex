defmodule MapLibre.Utils do
  @moduledoc false

  @kebab_case_properties %{
    root_properties: [
      :fill_extrusion,
      :fill_opacity_transition,
      :source_layer,
      :raster_dem
    ],
    background: [
      :background_color,
      :background_opacity,
      :background_pattern
    ],
    fill: [
      :fill_antialias,
      :fill_color,
      :fill_opacity,
      :fill_outline_color,
      :fill_pattern,
      :fill_sort_key,
      :fill_translate,
      :fill_translate_anchor
    ],
    line: [
      :line_blur,
      :line_cap,
      :line_color,
      :line_dasharray,
      :line_gap_width,
      :line_gradient,
      :line_join,
      :line_miter_limit,
      :line_offset,
      :line_opacity,
      :line_pattern,
      :line_round_limit,
      :line_sort_key,
      :line_translate,
      :line_translate_anchor,
      :line_width
    ],
    symbol: [
      :icon_allow_overlap,
      :icon_anchor,
      :icon_color,
      :icon_halo_blur,
      :icon_halo_color,
      :icon_halo_width,
      :icon_ignore_placement,
      :icon_image,
      :icon_keep_upright,
      :icon_offset,
      :icon_opacity,
      :icon_optional,
      :icon_overlap,
      :icon_padding,
      :icon_pitch_alignment,
      :icon_rotate,
      :icon_rotation_alignment,
      :icon_size,
      :icon_text_fit,
      :icon_text_fit_padding,
      :icon_translate,
      :icon_translate_anchor,
      :symbol_avoid_edges,
      :symbol_placement,
      :symbol_sort_key,
      :symbol_spacing,
      :symbol_z_order,
      :text_allow_overlap,
      :text_anchor,
      :text_color,
      :text_field,
      :text_font,
      :text_halo_blur,
      :text_halo_color,
      :text_halo_width,
      :text_ignore_placement,
      :text_justify,
      :text_keep_upright,
      :text_letter_spacing,
      :text_line_height,
      :text_max_angle,
      :text_max_width,
      :text_offset,
      :text_opacity,
      :text_optional,
      :text_overlap,
      :text_padding,
      :text_pitch_alignment,
      :text_radial_offset,
      :text_rotate,
      :text_rotation_alignment,
      :text_size,
      :text_transform,
      :text_translate,
      :text_translate_anchor,
      :text_variable_anchor,
      :text_writing_mode
    ],
    raster: [
      :raster_brightness_max,
      :raster_brightness_min,
      :raster_contrast,
      :raster_fade_duration,
      :raster_hue_rotate,
      :raster_opacity,
      :raster_resampling,
      :raster_saturation
    ],
    circle: [
      :circle_blur,
      :circle_color,
      :circle_opacity,
      :circle_pitch_alignment,
      :circle_pitch_scale,
      :circle_radius,
      :circle_sort_key,
      :circle_stroke_color,
      :circle_stroke_opacity,
      :circle_stroke_width,
      :circle_translate,
      :circle_translate_anchor
    ],
    fill_extrusion: [
      :fill_extrusion_base,
      :fill_extrusion_color,
      :fill_extrusion_height,
      :fill_extrusion_opacity,
      :fill_extrusion_pattern,
      :fill_extrusion_translate,
      :fill_extrusion_translate_anchor,
      :fill_extrusion_vertical_gradient
    ],
    heatmap: [
      :heatmap_color,
      :heatmap_intensity,
      :heatmap_opacity,
      :heatmap_radius,
      :heatmap_weight
    ],
    hillshade: [
      :hillshade_accent_color,
      :hillshade_exaggeration,
      :hillshade_highlight_color,
      :hillshade_illumination_anchor,
      :hillshade_illumination_direction,
      :hillshade_shadow_color
    ]
  }

  @doc """
  Returns the list of properties that support only kebab case
  """
  @spec kebab_case_properties() :: list()
  def kebab_case_properties() do
    @kebab_case_properties |> Map.values() |> List.flatten()
  end

  @doc """
  Ensures `Req` is available and raises an error otherwise.
  """
  def assert_req!() do
    unless Code.ensure_loaded?(Req) do
      raise RuntimeError, """
      to use styles from a url you need the :req package.

      You can install it by adding

          {:req, "~> 0.4 or ~> 1.0"}

      to your dependency list.
      """
    end
  end
end
