defmodule MapLibre.MixProject do
  use Mix.Project

  @version "0.1.0"
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
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.3"},
      {:req, "~> 0.2.2"},
      {:table, "~> 0.1.0"},
      {:geo, "~> 3.4", optional: true},
      {:ex_doc, "~> 0.28", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      main: "MapLibre",
      source_url: "https://github.com/cristineguadelupe/maplibre",
      source_ref: "v#{@version}"
    ]
  end
end
