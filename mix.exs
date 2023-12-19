defmodule MapLibre.MixProject do
  use Mix.Project

  @version "0.1.7"
  @description "Elixir bindings to MapLibre Style Specification"

  def project do
    [
      app: :maplibre,
      version: @version,
      description: @description,
      name: "MapLibre",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:table, "~> 0.1.0"},
      {:geo, "~> 3.5.1 or ~> 3.6"},
      {:req, "~> 0.3 or ~> 1.0", optional: true},
      {:ex_doc, "~> 0.28", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      main: "MapLibre",
      source_url: "https://github.com/livebook-dev/maplibre",
      source_ref: "v#{@version}"
    ]
  end

  def package do
    [
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => "https://github.com/livebook-dev/maplibre"
      }
    ]
  end
end
