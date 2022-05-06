# Maplibre

Elixir bindings to [MapLibre Style
Specification](https://maplibre.org/maplibre-gl-js-docs/style-spec/).

## Installation

### Inside Livebook

You most likely want to use Maplibre in [Livebook](https://github.com/livebook-dev/livebook), in
which case you can call `Mix.install/2`:

```elixir
Mix.install([
  {:maplibre, "~> 0.1.0"},
  {:kino_maplibre "~> 0.1.0"}
])
```

`:kino_maplibre` is necessary to ensure Livebook renders the maps nicely

### In Mix projects

You can add the `:maplibre` dependency to your `mix.exs`:

```elixir
def deps do
  [
    {:maplibre, "~> 0.1.0"}
  ]
end
```

## License
