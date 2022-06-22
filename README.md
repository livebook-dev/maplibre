# MapLibre

Elixir bindings to [MapLibre Style
Specification](https://maplibre.org/maplibre-gl-js-docs/style-spec/).

## Installation

### Inside Livebook

You most likely want to use MapLibre in [Livebook](https://github.com/livebook-dev/livebook), in
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

Copyright (C) 2022 Dashbit

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
