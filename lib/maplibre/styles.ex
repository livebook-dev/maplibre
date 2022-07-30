defmodule MapLibre.Styles do
  @default %{
    "bearing" => 0,
    "center" => [17.65431710431244, 32.954120326746775],
    "glyphs" => "https://demotiles.maplibre.org/font/{fontstack}/{range}.pbf",
    "id" => "43f36e14-e3f5-43c1-84c0-50a9c80dc5c7",
    "layers" => [
      %{
        "filter" => ["all"],
        "id" => "background",
        "layout" => %{"visibility" => "visible"},
        "maxzoom" => 24,
        "paint" => %{"background-color" => "#D8F2FF"},
        "type" => "background"
      },
      %{
        "filter" => ["all"],
        "id" => "coastline",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "maxzoom" => 24,
        "minzoom" => 0,
        "paint" => %{
          "line-blur" => 0.5,
          "line-color" => "#198EC8",
          "line-width" => %{"stops" => [[0, 2], [6, 6], [14, 9], [22, 18]]}
        },
        "source" => "maplibre",
        "source-layer" => "countries",
        "type" => "line"
      },
      %{
        "filter" => ["all"],
        "id" => "countries-fill",
        "layout" => %{"visibility" => "visible"},
        "maxzoom" => 24,
        "paint" => %{
          "fill-color" => [
            "match",
            ["get", "ADM0_A3"],
            [
              "ARM",
              "ATG",
              "AUS",
              "BTN",
              "CAN",
              "COG",
              "CZE",
              "GHA",
              "GIN",
              "HTI",
              "ISL",
              "JOR",
              "KHM",
              "KOR",
              "LVA",
              "MLT",
              "MNE",
              "MOZ",
              "PER",
              "SAH",
              "SGP",
              "SLV",
              "SOM",
              "TJK",
              "TUV",
              "UKR",
              "WSM"
            ],
            "#D6C7FF",
            [
              "AZE",
              "BGD",
              "CHL",
              "CMR",
              "CSI",
              "DEU",
              "DJI",
              "GUY",
              "HUN",
              "IOA",
              "JAM",
              "LBN",
              "LBY",
              "LSO",
              "MDG",
              "MKD",
              "MNG",
              "MRT",
              "NIU",
              "NZL",
              "PCN",
              "PYF",
              "SAU",
              "SHN",
              "STP",
              "TTO",
              "UGA",
              "UZB",
              "ZMB"
            ],
            "#EBCA8A",
            [
              "AGO",
              "ASM",
              "ATF",
              "BDI",
              "BFA",
              "BGR",
              "BLZ",
              "BRA",
              "CHN",
              "CRI",
              "ESP",
              "HKG",
              "HRV",
              "IDN",
              "IRN",
              "ISR",
              "KNA",
              "LBR",
              "LCA",
              "MAC",
              "MUS",
              "NOR",
              "PLW",
              "POL",
              "PRI",
              "SDN",
              "TUN",
              "UMI",
              "USA",
              "USG",
              "VIR",
              "VUT"
            ],
            "#C1E599",
            [
              "ARE",
              "ARG",
              "BHS",
              "CIV",
              "CLP",
              "DMA",
              "ETH",
              "GAB",
              "GRD",
              "HMD",
              "IND",
              "IOT",
              "IRL",
              "IRQ",
              "ITA",
              "KOS",
              "LUX",
              "MEX",
              "NAM",
              "NER",
              "PHL",
              "PRT",
              "RUS",
              "SEN",
              "SUR",
              "TZA",
              "VAT"
            ],
            "#E7E58F",
            [
              "AUT",
              "BEL",
              "BHR",
              "BMU",
              "BRB",
              "CYN",
              "DZA",
              "EST",
              "FLK",
              "GMB",
              "GUM",
              "HND",
              "JEY",
              "KGZ",
              "LIE",
              "MAF",
              "MDA",
              "NGA",
              "NRU",
              "SLB",
              "SOL",
              "SRB",
              "SWZ",
              "THA",
              "TUR",
              "VEN",
              "VGB"
            ],
            "#98DDA1",
            [
              "AIA",
              "BIH",
              "BLM",
              "BRN",
              "CAF",
              "CHE",
              "COM",
              "CPV",
              "CUB",
              "ECU",
              "ESB",
              "FSM",
              "GAZ",
              "GBR",
              "GEO",
              "KEN",
              "LTU",
              "MAR",
              "MCO",
              "MDV",
              "NFK",
              "NPL",
              "PNG",
              "PRY",
              "QAT",
              "SLE",
              "SPM",
              "SYC",
              "TCA",
              "TKM",
              "TLS",
              "VNM",
              "WEB",
              "WSB",
              "YEM",
              "ZWE"
            ],
            "#83D5F4",
            [
              "ABW",
              "ALB",
              "AND",
              "ATC",
              "BOL",
              "COD",
              "CUW",
              "CYM",
              "CYP",
              "EGY",
              "FJI",
              "GGY",
              "IMN",
              "KAB",
              "KAZ",
              "KWT",
              "LAO",
              "MLI",
              "MNP",
              "MSR",
              "MYS",
              "NIC",
              "NLD",
              "PAK",
              "PAN",
              "PRK",
              "ROU",
              "SGS",
              "SVN",
              "SWE",
              "TGO",
              "TWN",
              "VCT",
              "ZAF"
            ],
            "#B1BBF9",
            ["ATA", "GRL"],
            "#FFFFFF",
            "#EAB38F"
          ]
        },
        "source" => "maplibre",
        "source-layer" => "countries",
        "type" => "fill"
      },
      %{
        "id" => "countries-boundary",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "maxzoom" => 24,
        "paint" => %{
          "line-color" => "rgba(255, 255, 255, 1)",
          "line-opacity" => %{"stops" => [[3, 0.5], [6, 1]]},
          "line-width" => %{"stops" => [[1, 1], [6, 2], [14, 6], [22, 12]]}
        },
        "source" => "maplibre",
        "source-layer" => "countries",
        "type" => "line"
      },
      %{
        "filter" => ["all", ["!=", "name", "International Date Line"]],
        "id" => "geolines",
        "layout" => %{"visibility" => "visible"},
        "maxzoom" => 24,
        "paint" => %{
          "line-color" => "#1077B0",
          "line-dasharray" => [3, 3],
          "line-opacity" => 1
        },
        "source" => "maplibre",
        "source-layer" => "geolines",
        "type" => "line"
      },
      %{
        "filter" => ["all", ["!=", "name", "International Date Line"]],
        "id" => "geolines-label",
        "layout" => %{
          "symbol-placement" => "line",
          "text-field" => "{name}",
          "text-font" => ["Open Sans Semibold"],
          "text-size" => %{"stops" => [[2, 12], [6, 16]]},
          "visibility" => "visible"
        },
        "maxzoom" => 24,
        "minzoom" => 1,
        "paint" => %{
          "text-color" => "#1077B0",
          "text-halo-blur" => 1,
          "text-halo-color" => "rgba(255, 255, 255, 1)",
          "text-halo-width" => 1
        },
        "source" => "maplibre",
        "source-layer" => "geolines",
        "type" => "symbol"
      },
      %{
        "filter" => ["all"],
        "id" => "countries-label",
        "layout" => %{
          "text-field" => %{"stops" => [[2, "{ABBREV}"], [4, "{NAME}"]]},
          "text-font" => ["Open Sans Semibold"],
          "text-max-width" => 10,
          "text-size" => %{"stops" => [[2, 10], [4, 12], [6, 16]]},
          "text-transform" => %{"stops" => [[0, "uppercase"], [2, "none"]]},
          "visibility" => "visible"
        },
        "maxzoom" => 24,
        "minzoom" => 2,
        "paint" => %{
          "text-color" => "rgba(8, 37, 77, 1)",
          "text-halo-blur" => %{"stops" => [[2, 0.2], [6, 0]]},
          "text-halo-color" => "rgba(255, 255, 255, 1)",
          "text-halo-width" => %{"stops" => [[2, 1], [6, 1.6]]}
        },
        "source" => "maplibre",
        "source-layer" => "centroids",
        "type" => "symbol"
      }
    ],
    "metadata" => %{
      "maptiler:copyright" =>
        "This style was generated on MapTiler Cloud. Usage is governed by the license terms in https://github.com/maplibre/demotiles/blob/gh-pages/LICENSE",
      "openmaptiles:version" => "3.x"
    },
    "name" => "MapLibre",
    "pitch" => 0,
    "sources" => %{
      "maplibre" => %{
        "type" => "vector",
        "url" => "https://demotiles.maplibre.org/tiles/tiles.json"
      }
    },
    "version" => 8,
    "zoom" => 0.8619833357855968
  }

  @street %{
    "bearing" => 0,
    "center" => [0, 0],
    "glyphs" =>
      "https://api.maptiler.com/fonts/{fontstack}/{range}.pbf?key=get_your_own_OpIi9ZULNHzrESv6T2vL",
    "id" => "streets",
    "layers" => [
      %{
        "id" => "background",
        "layout" => %{"visibility" => "visible"},
        "paint" => %{
          "background-color" => %{
            "stops" => [
              [6, "rgba(252, 247, 229, 1)"],
              [10, "rgba(252, 247, 229, 1)"],
              [14, "rgba(246, 241, 229, 1)"],
              [15, "rgba(246, 241, 229, 1)"]
            ]
          }
        },
        "type" => "background"
      },
      %{
        "filter" => ["all", ["==", "class", "crop"]],
        "id" => "landcover_cropland",
        "layout" => %{"visibility" => "visible"},
        "paint" => %{
          "fill-color" => "rgba(243, 235, 195, 1)",
          "fill-opacity" => %{"base" => 1, "stops" => [[4, 1], [8, 0]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "globallandcover",
        "type" => "fill"
      },
      %{
        "filter" => ["all", ["==", "class", "grass"]],
        "id" => "landcover_grassland",
        "paint" => %{
          "fill-color" => "rgba(226, 236, 197, 1)",
          "fill-opacity" => %{"base" => 1, "stops" => [[4, 1], [8, 0]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "globallandcover",
        "type" => "fill"
      },
      %{
        "filter" => ["all", ["==", "class", "scrub"]],
        "id" => "landcover_scrubland",
        "paint" => %{
          "fill-color" => "rgba(199, 230, 179, 1)",
          "fill-opacity" => %{"base" => 1, "stops" => [[4, 1], [8, 0]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "globallandcover",
        "type" => "fill"
      },
      %{
        "filter" => ["all", ["==", "class", "tree"]],
        "id" => "landcover_treeland",
        "paint" => %{
          "fill-color" => "rgba(190, 222, 173, 1)",
          "fill-opacity" => %{"base" => 1, "stops" => [[4, 1], [8, 0]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "globallandcover",
        "type" => "fill"
      },
      %{
        "filter" => ["all", ["==", "class", "forest"]],
        "id" => "landcover_forestland",
        "paint" => %{
          "fill-color" => "rgba(171, 217, 170, 1)",
          "fill-opacity" => %{"base" => 1, "stops" => [[4, 1], [8, 0]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "globallandcover",
        "type" => "fill"
      },
      %{
        "filter" => ["all", ["==", "class", "snow"]],
        "id" => "landcover_snowland",
        "layout" => %{"visibility" => "visible"},
        "paint" => %{
          "fill-color" => "hsl(0, 0%, 100%)",
          "fill-opacity" => %{"base" => 1, "stops" => [[4, 1], [8, 0]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "globallandcover",
        "type" => "fill"
      },
      %{
        "filter" => ["all"],
        "id" => "park_outline",
        "layout" => %{"visibility" => "visible"},
        "minzoom" => 9,
        "paint" => %{
          "line-color" => "rgba(167, 203, 131, 1)",
          "line-dasharray" => [1, 1.5],
          "line-opacity" => 1,
          "line-width" => %{"stops" => [[9, 0.5], [14, 2]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "park",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["in", "class", "residential", "suburbs", "neighbourhood"]
        ],
        "id" => "landuse_residential",
        "layout" => %{"visibility" => "visible"},
        "maxzoom" => 24,
        "metadata" => %{},
        "paint" => %{
          "fill-color" => %{
            "base" => 1,
            "stops" => [
              [9, "rgba(233, 227, 210, 0.80)"],
              [12, "rgba(233, 227, 210, 0.55)"],
              [16, "rgba(233, 227, 210, 0.35)"]
            ]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "landuse",
        "type" => "fill"
      },
      %{
        "filter" => ["all", ["==", "class", "wood"]],
        "id" => "landcover_wood",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "fill-antialias" => false,
          "fill-color" => "hsla(98, 61%, 72%, 0.7)",
          "fill-opacity" => 0.4
        },
        "source" => "openmaptiles",
        "source-layer" => "landcover",
        "type" => "fill"
      },
      %{
        "filter" => ["all", ["==", "class", "grass"]],
        "id" => "landcover_grass",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "fill-antialias" => false,
          "fill-color" => "rgba(224, 232, 201, 1)",
          "fill-opacity" => 0.3
        },
        "source" => "openmaptiles",
        "source-layer" => "landcover",
        "type" => "fill"
      },
      %{
        "filter" => ["==", "class", "cemetery"],
        "id" => "landuse_cemetery",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{"fill-color" => "hsl(75, 37%, 81%)"},
        "source" => "openmaptiles",
        "source-layer" => "landuse",
        "type" => "fill"
      },
      %{
        "filter" => ["==", "class", "hospital"],
        "id" => "landuse_hospital",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{"fill-color" => "rgba(249, 225, 220, 1)"},
        "source" => "openmaptiles",
        "source-layer" => "landuse",
        "type" => "fill"
      },
      %{
        "filter" => ["==", "class", "school"],
        "id" => "landuse_school",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{"fill-color" => "rgb(236,238,204)"},
        "source" => "openmaptiles",
        "source-layer" => "landuse",
        "type" => "fill"
      },
      %{
        "filter" => ["all", ["in", "class", "stadium", "pitch", "track"]],
        "id" => "landuse_stadium",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{"fill-color" => "rgb(236,238,204)"},
        "source" => "openmaptiles",
        "source-layer" => "landuse",
        "type" => "fill"
      },
      %{
        "filter" => ["all", ["in", "class", "garages"]],
        "id" => "landuse_garage",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{"fill-color" => "rgba(236, 236, 236, 1)"},
        "source" => "openmaptiles",
        "source-layer" => "landuse",
        "type" => "fill"
      },
      %{
        "filter" => ["all", ["in", "class", "dam"]],
        "id" => "landuse_dam",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{"fill-color" => "rgba(209, 212, 190, 1)"},
        "source" => "openmaptiles",
        "source-layer" => "landuse",
        "type" => "fill"
      },
      %{
        "filter" => ["all", ["==", "brunnel", "tunnel"]],
        "id" => "waterway_tunnel",
        "layout" => %{"line-cap" => "round", "visibility" => "visible"},
        "minzoom" => 14,
        "paint" => %{
          "line-color" => "#a0c8f0",
          "line-dasharray" => [2, 4],
          "line-width" => %{"base" => 1.3, "stops" => [[13, 0.5], [20, 6]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "waterway",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "class", "river"],
          ["!=", "brunnel", "tunnel"],
          ["!=", "intermittent", 1]
        ],
        "id" => "waterway_river",
        "layout" => %{"line-cap" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#a0c8f0",
          "line-width" => %{"base" => 1.2, "stops" => [[11, 0.5], [20, 6]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "waterway",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "class", "river"],
          ["!=", "brunnel", "tunnel"],
          ["==", "intermittent", 1]
        ],
        "id" => "waterway_river_intermittent",
        "layout" => %{"line-cap" => "round"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#a0c8f0",
          "line-dasharray" => [3, 2],
          "line-width" => %{"base" => 1.2, "stops" => [[11, 0.5], [20, 6]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "waterway",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!=", "class", "river"],
          ["!=", "brunnel", "tunnel"],
          ["!=", "intermittent", 1]
        ],
        "id" => "waterway_other",
        "layout" => %{"line-cap" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#a0c8f0",
          "line-width" => %{"base" => 1.3, "stops" => [[13, 0.5], [20, 6]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "waterway",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!=", "class", "river"],
          ["!=", "brunnel", "tunnel"],
          ["==", "intermittent", 1]
        ],
        "id" => "waterway_other_intermittent",
        "layout" => %{"line-cap" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#a0c8f0",
          "line-dasharray" => [4, 3],
          "line-width" => %{"base" => 1.3, "stops" => [[13, 0.5], [20, 6]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "waterway",
        "type" => "line"
      },
      %{
        "filter" => ["all", ["==", "intermittent", 1]],
        "id" => "water_intermittent",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "fill-color" => "rgba(172, 218, 251, 1)",
          "fill-opacity" => 0.85
        },
        "source" => "openmaptiles",
        "source-layer" => "water",
        "type" => "fill"
      },
      %{
        "filter" => [
          "all",
          ["!=", "intermittent", 1],
          ["!=", "brunnel", "tunnel"]
        ],
        "id" => "water",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{"fill-color" => "rgba(134, 204, 250, 1)"},
        "source" => "openmaptiles",
        "source-layer" => "water",
        "type" => "fill"
      },
      %{
        "filter" => ["all", ["in", "class", "sand"]],
        "id" => "landcover_sand",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "fill-antialias" => false,
          "fill-color" => "#f2e9ac",
          "fill-opacity" => 1
        },
        "source" => "openmaptiles",
        "source-layer" => "landcover",
        "type" => "fill"
      },
      %{
        "filter" => ["all", ["in", "class", "sand"]],
        "id" => "landcover_sand_outline",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{"line-color" => "#f2e9ac", "line-width" => 2},
        "source" => "openmaptiles",
        "source-layer" => "landcover",
        "type" => "line"
      },
      %{
        "filter" => ["==", "$type", "Polygon"],
        "id" => "aeroway_fill",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "minzoom" => 11,
        "paint" => %{
          "fill-color" => "rgba(229, 228, 224, 1)",
          "fill-opacity" => 0.7
        },
        "source" => "openmaptiles",
        "source-layer" => "aeroway",
        "type" => "fill"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "LineString"],
          ["==", "class", "runway"]
        ],
        "id" => "aeroway_runway",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "minzoom" => 11,
        "paint" => %{
          "line-color" => "#f0ede9",
          "line-width" => %{"base" => 1.2, "stops" => [[11, 3], [20, 16]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "aeroway",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "LineString"],
          ["==", "class", "taxiway"]
        ],
        "id" => "aeroway_taxiway",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "minzoom" => 11,
        "paint" => %{
          "line-color" => "#f0ede9",
          "line-width" => %{"base" => 1.2, "stops" => [[11, 0.5], [20, 6]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "aeroway",
        "type" => "line"
      },
      %{
        "filter" => ["all", ["in", "class", "ferry"]],
        "id" => "ferry",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "paint" => %{
          "line-color" => "rgba(108, 159, 182, 1)",
          "line-dasharray" => [2, 2],
          "line-width" => 1.1
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "class", "motorway"],
          ["==", "ramp", 1],
          ["==", "brunnel", "tunnel"]
        ],
        "id" => "tunnel_motorway_link_casing",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "line-color" => "#e9ac77",
          "line-dasharray" => [0.5, 0.25],
          "line-opacity" => 1,
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12, 1], [13, 3], [14, 4], [20, 15]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "tunnel"],
          ["in", "class", "service", "track"]
        ],
        "id" => "tunnel_service_track_casing",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#cfcdca",
          "line-dasharray" => [0.5, 0.25],
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12, 0.5], [13, 1], [14, 4], [20, 11]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "ramp", "1"],
          ["==", "brunnel", "tunnel"],
          [">", "layer", 0]
        ],
        "id" => "tunnel_link_casing",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#e9ac77",
          "line-opacity" => 1,
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12, 1], [13, 3], [14, 4], [20, 15]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => ["all", ["==", "brunnel", "tunnel"], ["==", "class", "minor"]],
        "id" => "tunnel_minor_casing",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#cfcdca",
          "line-dasharray" => [0.5, 0.25],
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12, 0.5], [13, 1.5], [14, 4], [20, 16]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "tunnel"],
          ["in", "class", "street", "street_limited"]
        ],
        "id" => "tunnel_street_casing",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#cfcdca",
          "line-opacity" => %{"stops" => [[12, 0], [12.5, 1]]},
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12, 0.5], [13, 1], [14, 4], [20, 15]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "tunnel"],
          ["in", "class", "secondary", "tertiary"]
        ],
        "id" => "tunnel_secondary_tertiary_casing",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "rgba(195, 189, 187, 1)",
          "line-dasharray" => [0.5, 0.25],
          "line-opacity" => 1,
          "line-width" => %{"base" => 1.2, "stops" => [[8, 1.5], [20, 17]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "tunnel"],
          ["in", "class", "primary", "trunk"]
        ],
        "id" => "tunnel_trunk_primary_casing",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#e9ac77",
          "line-dasharray" => [0.5, 0.25],
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[5, 0.4], [6, 0.7], [7, 1.75], [20, 22]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "class", "motorway"],
          ["==", "brunnel", "tunnel"]
        ],
        "id" => "tunnel_motorway_casing",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "line-color" => "#e9ac77",
          "line-dasharray" => [0.5, 0.25],
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[5, 0.4], [6, 0.7], [7, 1.75], [20, 22]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "LineString"],
          ["==", "brunnel", "tunnel"],
          ["in", "class", "path", "pedestrian"]
        ],
        "id" => "tunnel_path_pedestrian",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "rgba(204, 196, 176, 0.45)",
          "line-dasharray" => [1, 0.75],
          "line-width" => %{"base" => 1.2, "stops" => [[14, 0.5], [20, 6]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "class", "motorway_link"],
          ["==", "ramp", 1],
          ["==", "brunnel", "tunnel"]
        ],
        "id" => "tunnel_motorway_link",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "line-color" => "#fc8",
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12.5, 0], [13, 1.5], [14, 2.5], [20, 11.5]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "tunnel"],
          ["in", "class", "service", "track"]
        ],
        "id" => "tunnel_service_track",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fff",
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[13, 1.5], [16, 2], [20, 8]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "tunnel"],
          ["in", "class", "service_construction", "track_construction"]
        ],
        "id" => "tunnel_service_track_construction",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fff",
          "line-dasharray" => [2, 2],
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[13, 1.5], [16, 2], [20, 8]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "ramp", "1"],
          ["==", "brunnel", "tunnel"],
          [">", "layer", 0]
        ],
        "id" => "tunnel_link",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fff4c6",
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12.5, 0], [13, 1.5], [14, 2.5], [20, 11.5]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => ["all", ["==", "brunnel", "tunnel"], ["in", "class", "minor"]],
        "id" => "tunnel_minor",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fff",
          "line-opacity" => 1,
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12.9, 0], [13, 1], [14, 2.5], [20, 13]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "tunnel"],
          ["in", "class", "minor_construction"]
        ],
        "id" => "tunnel_minor_construction",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fff",
          "line-dasharray" => [2, 2],
          "line-opacity" => 1,
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12.9, 0], [13, 1], [14, 2.5], [20, 13]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "tunnel"],
          ["in", "class", "secondary", "tertiary"]
        ],
        "id" => "tunnel_secondary_tertiary",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "rgba(245, 245, 243, 1)",
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[6.5, 0], [8, 0.5], [20, 13]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "tunnel"],
          ["in", "class", "secondary_construction", "tertiary_construction"]
        ],
        "id" => "tunnel_secondary_tertiary_construction",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fff",
          "line-dasharray" => [2, 2],
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[6.5, 0], [8, 0.5], [20, 13]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "tunnel"],
          ["in", "class", "primary", "trunk"]
        ],
        "id" => "tunnel_trunk_primary",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fff4c6",
          "line-width" => %{"base" => 1.2, "stops" => [[5, 0], [7, 1], [20, 18]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "tunnel"],
          ["in", "class", "primary_construction", "trunk_construction"]
        ],
        "id" => "tunnel_trunk_primary_construction",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fff4c6",
          "line-dasharray" => [2, 2],
          "line-width" => %{"base" => 1.2, "stops" => [[5, 0], [7, 1], [20, 18]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "class", "motorway"],
          ["==", "brunnel", "tunnel"]
        ],
        "id" => "tunnel_motorway",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "line-color" => "#ffdaa6",
          "line-width" => %{"base" => 1.2, "stops" => [[5, 0], [7, 1], [20, 18]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "class", "motorway_construction"],
          ["==", "brunnel", "tunnel"]
        ],
        "id" => "tunnel_motorway_construction",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "line-color" => "#ffdaa6",
          "line-dasharray" => [2, 2],
          "line-width" => %{"base" => 1.2, "stops" => [[5, 0], [7, 1], [20, 18]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => ["all", ["==", "brunnel", "tunnel"], ["in", "class", "rail"]],
        "id" => "tunnel_major_rail",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#bbb",
          "line-width" => %{
            "base" => 1.4,
            "stops" => [[14, 0.4], [15, 0.75], [20, 2]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => ["all", ["==", "brunnel", "tunnel"], ["==", "class", "rail"]],
        "id" => "tunnel_major_rail_hatching",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#bbb",
          "line-dasharray" => [0.2, 8],
          "line-width" => %{
            "base" => 1.4,
            "stops" => [[14.5, 0], [15, 3], [20, 8]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => ["all", ["==", "$type", "Polygon"], ["==", "class", "pier"]],
        "id" => "road_area_pier",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "fill-antialias" => true,
          "fill-color" => "rgba(246, 241, 229, 1)"
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "fill"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "LineString"],
          ["in", "class", "pier"]
        ],
        "id" => "road_pier",
        "layout" => %{"line-cap" => "round", "line-join" => "round"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "rgba(246, 241, 229, 1)",
          "line-width" => %{"base" => 1.2, "stops" => [[15, 1], [17, 4]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "Polygon"],
          ["==", "brunnel", "bridge"]
        ],
        "id" => "road_area_bridge",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "fill-antialias" => true,
          "fill-color" => "rgba(246, 241, 229, 0.6)"
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "fill"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "Polygon"],
          ["!has", "brunnel"],
          ["!in", "class", "bridge", "pier"]
        ],
        "id" => "road_area_pattern",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{"fill-pattern" => "pedestrian_polygon"},
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "fill"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["in", "class", "service", "track"]
        ],
        "id" => "road_service_track_casing",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#cfcdca",
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12, 0.5], [13, 1], [14, 4], [20, 11]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          [
            "!in",
            "class",
            "motorway",
            "trunk",
            "primary",
            "pedestrian",
            "path",
            "track",
            "service"
          ],
          ["==", "ramp", 1]
        ],
        "id" => "road_link_casing",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 13,
        "paint" => %{
          "line-color" => "#e9ac77",
          "line-opacity" => 1,
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12, 1], [13, 3], [14, 4], [20, 15]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["==", "ramp", 1],
          ["in", "class", "primary", "trunk"]
        ],
        "id" => "road_trunk_primary_link_casing",
        "layout" => %{
          "line-cap" => "butt",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#e9ac77",
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[5, 0], [7, 0.7], [20, 14]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["==", "class", "motorway"],
          ["==", "ramp", 1]
        ],
        "id" => "road_motorway_link_casing",
        "layout" => %{
          "line-cap" => "butt",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 10,
        "paint" => %{
          "line-color" => "#e9ac77",
          "line-opacity" => 1,
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[9.9, 0], [10, 1.4], [14, 8], [20, 12]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "LineString"],
          ["!in", "brunnel", "bridge", "tunnel"],
          ["in", "class", "minor"],
          ["!=", "ramp", "1"]
        ],
        "id" => "road_minor_casing",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#cfcdca",
          "line-opacity" => 1,
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12, 0.7], [13, 1], [14, 4], [20, 16]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["in", "class", "secondary", "tertiary"],
          ["!=", "ramp", 1]
        ],
        "id" => "road_secondary_tertiary_casing",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "paint" => %{
          "line-color" => "rgba(195, 189, 187, 1)",
          "line-opacity" => 1,
          "line-width" => %{"base" => 1.2, "stops" => [[8, 1.5], [20, 17]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["!=", "ramp", 1],
          ["in", "class", "primary", "trunk"],
          ["!=", "ramp", 1]
        ],
        "id" => "road_trunk_primary_casing",
        "layout" => %{
          "line-cap" => "butt",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#e9ac77",
          "line-opacity" => 1,
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[5, 0.4], [6, 0.7], [7, 1.75], [20, 22]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["==", "class", "motorway"],
          ["!=", "ramp", 1]
        ],
        "id" => "road_motorway_casing",
        "layout" => %{
          "line-cap" => "butt",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "line-color" => "#e9ac77",
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[5, 0.4], [6, 0.7], [7, 1.75], [20, 22]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "LineString"],
          ["!in", "brunnel", "bridge", "tunnel"],
          ["in", "class", "path", "pedestrian"]
        ],
        "id" => "road_path_pedestrian",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "minzoom" => 12,
        "paint" => %{
          "line-color" => "rgba(176, 169, 150, 0.45)",
          "line-dasharray" => [1, 1],
          "line-width" => %{"base" => 1.2, "stops" => [[12, 1], [16, 2], [20, 3]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["==", "ramp", 1],
          [
            "!in",
            "class",
            "motorway",
            "trunk",
            "primary",
            "pedestrian",
            "path",
            "track",
            "service"
          ]
        ],
        "id" => "road_link",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 13,
        "paint" => %{
          "line-color" => "#fea",
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12.5, 0], [13, 1.5], [14, 2.5], [20, 11.5]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["==", "ramp", 1],
          ["in", "class", "primary", "trunk"]
        ],
        "id" => "road_trunk_primary_link",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fea",
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[5, 0], [7, 0.5], [20, 10]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["==", "class", "motorway"],
          ["==", "ramp", 1]
        ],
        "id" => "road_motorway_link",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 10,
        "paint" => %{
          "line-color" => "#fc8",
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[9.9, 0], [10, 1], [14, 6], [20, 10]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["in", "class", "service", "track"]
        ],
        "id" => "road_service_track",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 13,
        "paint" => %{
          "line-color" => "rgba(255, 255, 255, 1)",
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[13, 1.5], [16, 2], [20, 8]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["in", "class", "service_construction", "track_construction"]
        ],
        "id" => "road_service_track_construction",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 13,
        "paint" => %{
          "line-color" => "#fff",
          "line-dasharray" => [2, 2],
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[13, 1.5], [16, 2], [20, 8]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "LineString"],
          [
            "all",
            ["!in", "brunnel", "bridge", "tunnel"],
            ["in", "class", "minor"]
          ]
        ],
        "id" => "road_minor",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fff",
          "line-opacity" => 1,
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12.9, 0], [13, 1], [14, 2.5], [20, 13]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "LineString"],
          [
            "all",
            ["!in", "brunnel", "bridge", "tunnel"],
            ["in", "class", "minor_construction"]
          ]
        ],
        "id" => "road_minor_construction",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fff",
          "line-dasharray" => [2, 2],
          "line-opacity" => 1,
          "line-width" => %{"base" => 1.2, "stops" => [[14, 2.5], [20, 18]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["in", "class", "secondary", "tertiary"]
        ],
        "id" => "road_secondary_tertiary",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "paint" => %{
          "line-color" => "rgba(245, 245, 243, 1)",
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[6.5, 0], [8, 0.5], [20, 13]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["in", "class", "secondary_construction", "tertiary_construction"]
        ],
        "id" => "road_secondary_tertiary_construction",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fff",
          "line-dasharray" => [2, 2],
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[6.5, 0], [8, 0.5], [20, 13]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["!=", "ramp", 1],
          ["in", "class", "primary", "trunk"]
        ],
        "id" => "road_trunk_primary",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fea",
          "line-width" => %{"base" => 1.2, "stops" => [[5, 0], [7, 1], [20, 18]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["!=", "ramp", 1],
          ["in", "class", "primary_construction", "trunk_construction"]
        ],
        "id" => "road_trunk_primary_construction",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fea",
          "line-dasharray" => [2, 2],
          "line-width" => %{"base" => 1.2, "stops" => [[5, 0], [7, 1], [20, 18]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["==", "class", "motorway"],
          ["!=", "ramp", 1]
        ],
        "id" => "road_motorway",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "line-color" => %{
            "base" => 1,
            "stops" => [[5, "hsl(26, 87%, 62%)"], [6, "#fc8"]]
          },
          "line-width" => %{"base" => 1.2, "stops" => [[5, 0], [7, 1], [20, 18]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["==", "class", "motorway_construction"],
          ["!=", "ramp", 1]
        ],
        "id" => "road_motorway_construction",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "line-color" => %{
            "base" => 1,
            "stops" => [[5, "hsl(26, 87%, 62%)"], [6, "#fc8"]]
          },
          "line-dasharray" => [2, 2],
          "line-width" => %{"base" => 1.2, "stops" => [[5, 0], [7, 1], [20, 18]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["in", "class", "rail"]
        ],
        "id" => "road_major_rail",
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#bbb",
          "line-width" => %{
            "base" => 1.4,
            "stops" => [[14, 0.4], [15, 0.75], [20, 2]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["==", "class", "rail"]
        ],
        "id" => "road_major_rail_hatching",
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#bbb",
          "line-dasharray" => [0.2, 8],
          "line-width" => %{
            "base" => 1.4,
            "stops" => [[14.5, 0], [15, 3], [20, 8]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["in", "subclass", "tram", "light_rail"]
        ],
        "id" => "road_minor_rail",
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#bbb",
          "line-width" => %{
            "base" => 1.4,
            "stops" => [[14, 0.4], [15, 0.75], [20, 2]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["!in", "brunnel", "bridge", "tunnel"],
          ["in", "subclass", "tram", "light_rail"]
        ],
        "id" => "road_minor_rail_hatching",
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#bbb",
          "line-dasharray" => [0.2, 4],
          "line-width" => %{
            "base" => 1.4,
            "stops" => [[14.5, 0], [15, 2], [20, 6]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "id" => "building",
        "layout" => %{"visibility" => "visible"},
        "maxzoom" => 14,
        "metadata" => %{},
        "minzoom" => 13,
        "paint" => %{
          "fill-color" => "rgba(189, 185, 181, 0.3)",
          "fill-outline-color" => %{
            "base" => 1,
            "stops" => [[13, "hsla(35, 6%, 79%, 0.32)"], [14, "hsl(35, 6%, 79%)"]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "building",
        "type" => "fill"
      },
      %{
        "filter" => ["all", ["!has", "hide_3d"]],
        "id" => "building-3d",
        "layout" => %{"visibility" => "visible"},
        "metadata" => %{},
        "minzoom" => 14,
        "paint" => %{
          "fill-extrusion-base" => %{
            "property" => "render_min_height",
            "type" => "identity"
          },
          "fill-extrusion-color" => "rgba(189, 185, 181, 1)",
          "fill-extrusion-height" => %{
            "property" => "render_height",
            "type" => "identity"
          },
          "fill-extrusion-opacity" => 0.3
        },
        "source" => "openmaptiles",
        "source-layer" => "building",
        "type" => "fill-extrusion"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "LineString"],
          ["==", "brunnel", "bridge"]
        ],
        "id" => "waterway-bridge-case",
        "layout" => %{"line-cap" => "butt", "line-join" => "miter"},
        "paint" => %{
          "line-color" => "#bbbbbb",
          "line-gap-width" => %{"base" => 1.3, "stops" => [[13, 0.5], [20, 6]]},
          "line-width" => %{"base" => 1.6, "stops" => [[12, 0.5], [20, 5]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "waterway",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "LineString"],
          ["==", "brunnel", "bridge"]
        ],
        "id" => "waterway-bridge",
        "layout" => %{"line-cap" => "round", "line-join" => "round"},
        "paint" => %{
          "line-color" => "rgba(134, 204, 250, 1)",
          "line-width" => %{"base" => 1.3, "stops" => [[13, 0.5], [20, 6]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "waterway",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "class", "motorway"],
          ["==", "ramp", 1],
          ["==", "brunnel", "bridge"]
        ],
        "id" => "bridge_motorway_link_casing",
        "layout" => %{"line-join" => "round"},
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "line-color" => "#e9ac77",
          "line-opacity" => 1,
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[9.9, 0], [10, 1.4], [14, 8], [20, 12]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "bridge"],
          ["in", "class", "service", "track"]
        ],
        "id" => "bridge_service_track_casing",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#cfcdca",
          "line-width" => %{"base" => 1.2, "stops" => [[13, 1.5], [20, 11]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => ["all", ["==", "class", "link"], ["==", "brunnel", "bridge"]],
        "id" => "bridge_link_casing",
        "layout" => %{"line-join" => "round"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#e9ac77",
          "line-opacity" => 1,
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12, 1], [13, 3], [14, 4], [20, 15]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "bridge"],
          ["in", "class", "street", "street_limited"]
        ],
        "id" => "bridge_street_casing",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "hsl(36, 6%, 74%)",
          "line-opacity" => %{"stops" => [[12, 0], [12.5, 1]]},
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12, 0.5], [13, 1], [14, 4], [20, 18]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "LineString"],
          ["==", "brunnel", "bridge"],
          ["in", "class", "path", "pedestrian"]
        ],
        "id" => "bridge_path_pedestrian_casing",
        "layout" => %{"line-join" => "miter", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "hsl(35, 6%, 80%)",
          "line-dasharray" => [1, 0],
          "line-width" => %{"base" => 1.2, "stops" => [[14, 1.5], [20, 18]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "LineString"],
          ["in", "brunnel", "bridge", "tunnel"],
          ["in", "class", "minor"],
          ["!=", "ramp", "1"]
        ],
        "id" => "bridge_minor_casing",
        "layout" => %{
          "line-cap" => "butt",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#cfcdca",
          "line-opacity" => 1,
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12, 0.7], [13, 1], [14, 4], [20, 16]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "bridge"],
          ["in", "class", "secondary", "tertiary"]
        ],
        "id" => "bridge_secondary_tertiary_casing",
        "layout" => %{"line-join" => "round"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "rgba(195, 189, 187, 1)",
          "line-opacity" => 1,
          "line-width" => %{"base" => 1.2, "stops" => [[8, 1.5], [20, 17]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "bridge"],
          ["in", "class", "primary", "trunk"]
        ],
        "id" => "bridge_trunk_primary_casing",
        "layout" => %{"line-join" => "round"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#e9ac77",
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[5, 0.4], [6, 0.7], [7, 1.75], [20, 22]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "class", "motorway"],
          ["==", "brunnel", "bridge"],
          ["!=", "ramp", 1]
        ],
        "id" => "bridge_motorway_casing",
        "layout" => %{"line-join" => "round"},
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "line-color" => "#e9ac77",
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[5, 0.4], [6, 0.7], [7, 1.75], [20, 22]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "LineString"],
          ["==", "brunnel", "bridge"],
          ["in", "class", "path", "pedestrian"]
        ],
        "id" => "bridge_path_pedestrian",
        "metadata" => %{},
        "paint" => %{
          "line-color" => "hsl(0, 0%, 100%)",
          "line-dasharray" => [1, 0.3],
          "line-width" => %{"base" => 1.2, "stops" => [[14, 0.5], [20, 10]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "class", "motorway"],
          ["==", "ramp", 1],
          ["==", "brunnel", "bridge"]
        ],
        "id" => "bridge_motorway_link",
        "layout" => %{"line-join" => "round"},
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "line-color" => "#fc8",
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[9.9, 0], [10, 1], [14, 6], [20, 10]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "bridge"],
          ["in", "class", "service", "track"]
        ],
        "id" => "bridge_service_track",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fff",
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[13, 1.5], [16, 2], [20, 8]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "bridge"],
          ["in", "class", "service_construction", "track_construction"]
        ],
        "id" => "bridge_service_track_construction",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fff",
          "line-dasharray" => [2, 2],
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[13, 1.5], [16, 2], [20, 8]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => ["all", ["==", "class", "link"], ["==", "brunnel", "bridge"]],
        "id" => "bridge_link",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fea",
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12.5, 0], [13, 1.5], [14, 2.5], [20, 11.5]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "bridge"],
          ["in", "class", "street", "street_limited"]
        ],
        "id" => "bridge_street",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fff",
          "line-opacity" => 1,
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[13.5, 0], [14, 2.5], [20, 16]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => ["all", ["==", "brunnel", "bridge"], ["in", "class", "minor"]],
        "id" => "bridge_minor",
        "layout" => %{"line-join" => "round"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fff",
          "line-opacity" => 1,
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12.9, 0], [13, 1], [14, 2.5], [20, 13]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "bridge"],
          ["in", "class", "minor_construction"]
        ],
        "id" => "bridge_minor_construction",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fff",
          "line-dasharray" => [2, 2],
          "line-opacity" => 1,
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[12.9, 0], [13, 1], [14, 2.5], [20, 13]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "bridge"],
          ["in", "class", "secondary", "tertiary"]
        ],
        "id" => "bridge_secondary_tertiary",
        "layout" => %{"line-join" => "round"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "rgba(245, 245, 243, 1)",
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[6.5, 0], [8, 0.5], [20, 13]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "bridge"],
          ["in", "class", "secondary_construction", "tertiary_construction"]
        ],
        "id" => "bridge_secondary_tertiary_construction",
        "layout" => %{"line-join" => "round"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fff",
          "line-dasharray" => [2, 2],
          "line-width" => %{
            "base" => 1.2,
            "stops" => [[6.5, 0], [8, 0.5], [20, 13]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "bridge"],
          ["in", "class", "primary", "trunk"]
        ],
        "id" => "bridge_trunk_primary",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fea",
          "line-width" => %{"base" => 1.2, "stops" => [[5, 0], [7, 1], [20, 18]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "brunnel", "bridge"],
          ["in", "class", "primary_construction", "trunk_construction"]
        ],
        "id" => "bridge_trunk_primary_construction",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#fea",
          "line-dasharray" => [2, 2],
          "line-width" => %{"base" => 1.2, "stops" => [[5, 0], [7, 1], [20, 18]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "class", "motorway"],
          ["==", "brunnel", "bridge"],
          ["!=", "ramp", 1]
        ],
        "id" => "bridge_motorway",
        "layout" => %{"line-join" => "round"},
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "line-color" => "#fc8",
          "line-width" => %{"base" => 1.2, "stops" => [[5, 0], [7, 1], [20, 18]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "class", "motorway_construction"],
          ["==", "brunnel", "bridge"],
          ["!=", "ramp", 1]
        ],
        "id" => "bridge_motorway_construction",
        "layout" => %{"line-join" => "round"},
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "line-color" => "#fc8",
          "line-dasharray" => [2, 2],
          "line-width" => %{"base" => 1.2, "stops" => [[5, 0], [7, 1], [20, 18]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => ["all", ["==", "class", "rail"], ["==", "brunnel", "bridge"]],
        "id" => "bridge_major_rail",
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#bbb",
          "line-width" => %{
            "base" => 1.4,
            "stops" => [[14, 0.4], [15, 0.75], [20, 2]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => ["all", ["==", "class", "rail"], ["==", "brunnel", "bridge"]],
        "id" => "bridge_major_rail_hatching",
        "metadata" => %{},
        "paint" => %{
          "line-color" => "#bbb",
          "line-dasharray" => [0.2, 8],
          "line-width" => %{
            "base" => 1.4,
            "stops" => [[14.5, 0], [15, 3], [20, 8]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => ["==", "class", "aerialway"],
        "id" => "cablecar",
        "layout" => %{"line-cap" => "round", "visibility" => "visible"},
        "minzoom" => 13,
        "paint" => %{
          "line-color" => "hsl(0, 0%, 70%)",
          "line-width" => %{"base" => 1, "stops" => [[13, 1], [19, 2]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => ["==", "class", "aerialway"],
        "id" => "cablecar-dash",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "bevel",
          "visibility" => "visible"
        },
        "minzoom" => 13,
        "paint" => %{
          "line-color" => "rgba(164, 164, 164, 1)",
          "line-dasharray" => [2, 2],
          "line-width" => %{"base" => 1, "stops" => [[13, 2], [19, 4]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => ["all", ["in", "admin_level", 3, 4], ["==", "maritime", 0]],
        "id" => "boundary_3",
        "layout" => %{"line-join" => "round", "visibility" => "visible"},
        "metadata" => %{},
        "minzoom" => 3,
        "paint" => %{
          "line-color" => "#9e9cab",
          "line-dasharray" => [5, 3],
          "line-width" => %{
            "base" => 1,
            "stops" => [[4, 0.4], [5, 0.7], [12, 1.6]]
          }
        },
        "source" => "openmaptiles",
        "source-layer" => "boundary",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "admin_level", 2],
          ["==", "maritime", 0],
          ["==", "disputed", 0],
          ["!has", "claimed_by"]
        ],
        "id" => "boundary_2_z0-4",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "maxzoom" => 5,
        "metadata" => %{},
        "minzoom" => 0,
        "paint" => %{
          "line-color" => "rgba(139, 139, 139, 1)",
          "line-opacity" => 1,
          "line-width" => %{"base" => 1, "stops" => [[3, 1], [5, 1.2]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "boundary",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "admin_level", 2],
          ["!has", "claimed_by"],
          ["==", "disputed", 0],
          ["==", "maritime", 1]
        ],
        "id" => "boundary_2_z0-4_maritime",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "maxzoom" => 5,
        "metadata" => %{},
        "minzoom" => 0,
        "paint" => %{
          "line-color" => "rgba(98,185,229,1)",
          "line-opacity" => 1,
          "line-width" => %{"base" => 1, "stops" => [[3, 1], [5, 1.2]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "boundary",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "admin_level", 2],
          ["==", "maritime", 0],
          ["==", "disputed", 1]
        ],
        "id" => "boundary_2_z0-4_disputed",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "maxzoom" => 5,
        "metadata" => %{},
        "minzoom" => 0,
        "paint" => %{
          "line-color" => "rgba(139, 139, 139, 1)",
          "line-dasharray" => [2, 2],
          "line-opacity" => 1,
          "line-width" => %{"base" => 1, "stops" => [[3, 1], [5, 1.2]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "boundary",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "admin_level", 2],
          ["==", "maritime", 1],
          ["==", "disputed", 1]
        ],
        "id" => "boundary_2_z0-4_disputed_maritime",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "maxzoom" => 5,
        "metadata" => %{},
        "minzoom" => 0,
        "paint" => %{
          "line-color" => "rgba(98,185,229,1)",
          "line-dasharray" => [2, 2],
          "line-opacity" => 1,
          "line-width" => %{"base" => 1, "stops" => [[3, 1], [5, 1.2]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "boundary",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "admin_level", 2],
          ["==", "disputed", 0],
          ["==", "maritime", 0]
        ],
        "id" => "boundary_2_z5",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "line-color" => "rgba(139, 139, 139, 1)",
          "line-opacity" => 1,
          "line-width" => %{"base" => 1, "stops" => [[5, 1.2], [12, 3]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "boundary",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "admin_level", 2],
          ["==", "disputed", 1],
          ["==", "maritime", 0]
        ],
        "id" => "boundary_2_z5_disputed",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "line-color" => "rgba(120, 120, 120, 1)",
          "line-dasharray" => [4, 3],
          "line-opacity" => 1,
          "line-width" => %{"base" => 1, "stops" => [[5, 1.2], [12, 3]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "boundary",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "admin_level", 2],
          ["==", "disputed", 1],
          ["==", "maritime", 1]
        ],
        "id" => "boundary_2_z5_disputed_maritime",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "line-color" => "rgba(98,185,229,1)",
          "line-dasharray" => [4, 3],
          "line-opacity" => 1,
          "line-width" => %{"base" => 1, "stops" => [[5, 1.2], [12, 3]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "boundary",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "admin_level", 2],
          ["==", "disputed", 0],
          ["==", "maritime", 1]
        ],
        "id" => "boundary_2_z5_maritime",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "line-color" => "rgba(98,185,229,1)",
          "line-opacity" => 1,
          "line-width" => %{"base" => 1, "stops" => [[5, 1.2], [12, 3]]}
        },
        "source" => "openmaptiles",
        "source-layer" => "boundary",
        "type" => "line"
      },
      %{
        "filter" => ["all", ["==", "$type", "LineString"]],
        "id" => "water_name_line",
        "layout" => %{
          "symbol-placement" => "line",
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            " ",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Roboto Regular", "Noto Sans Regular"],
          "text-max-width" => 5,
          "text-size" => 12,
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 0,
        "paint" => %{
          "text-color" => "#5d60be",
          "text-halo-color" => "rgba(255,255,255,0.7)",
          "text-halo-width" => 1
        },
        "source" => "openmaptiles",
        "source-layer" => "water_name",
        "type" => "symbol"
      },
      %{
        "filter" => ["all", ["==", "$type", "Point"], ["!=", "class", "ocean"]],
        "id" => "water_name_point",
        "layout" => %{
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            "\n",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Roboto Regular", "Noto Sans Regular"],
          "text-max-width" => 5,
          "text-size" => 12,
          "visibility" => "visible"
        },
        "maxzoom" => 24,
        "metadata" => %{},
        "minzoom" => 2,
        "paint" => %{
          "text-color" => "rgba(76, 125, 173, 1)",
          "text-halo-color" => "rgba(255,255,255,0)",
          "text-halo-width" => 1
        },
        "source" => "openmaptiles",
        "source-layer" => "water_name",
        "type" => "symbol"
      },
      %{
        "filter" => ["all", ["==", "$type", "Point"], ["==", "class", "ocean"]],
        "id" => "water_ocean_name_point",
        "layout" => %{
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            "\n",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Roboto Regular", "Noto Sans Regular"],
          "text-max-width" => 5,
          "text-size" => 12,
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 0,
        "paint" => %{
          "text-color" => "rgba(76, 125, 173, 1)",
          "text-halo-color" => "rgba(255,255,255,0)",
          "text-halo-width" => 1
        },
        "source" => "openmaptiles",
        "source-layer" => "water_name",
        "type" => "symbol"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "Point"],
          [">=", "rank", 20],
          [
            "any",
            [
              "all",
              ["in", "class", "pitch"],
              ["in", "subclass", "soccer", "tennis", "baseball", "basketball", "swimming", "golf"]
            ]
          ],
          ["any", ["!has", "level"], ["==", "level", 0]]
        ],
        "id" => "poi_z16_subclass",
        "layout" => %{
          "icon-image" => "{subclass}_11",
          "text-anchor" => "top",
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            "\n",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Roboto Condensed Italic", "Noto Sans Italic"],
          "text-max-width" => 9,
          "text-offset" => [0, 0.6],
          "text-padding" => 2,
          "text-size" => 12,
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 16,
        "paint" => %{
          "text-color" => "#666",
          "text-halo-blur" => 0.5,
          "text-halo-color" => "#ffffff",
          "text-halo-width" => 1
        },
        "source" => "openmaptiles",
        "source-layer" => "poi",
        "type" => "symbol"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "Point"],
          ["!=", "class", "swimming_pool"],
          [">=", "rank", 20],
          [
            "none",
            [
              "all",
              ["in", "class", "pitch"],
              ["in", "subclass", "soccer", "tennis", "baseball", "basketball", "swimming", "golf"]
            ]
          ],
          ["any", ["!has", "level"], ["==", "level", 0]]
        ],
        "id" => "poi_z16",
        "layout" => %{
          "icon-image" => "{class}_11",
          "text-anchor" => "top",
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            "\n",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Roboto Condensed Italic", "Noto Sans Italic"],
          "text-max-width" => 9,
          "text-offset" => [0, 0.6],
          "text-padding" => 2,
          "text-size" => 12,
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 16,
        "paint" => %{
          "text-color" => "#666",
          "text-halo-blur" => 0.5,
          "text-halo-color" => "#ffffff",
          "text-halo-width" => 1
        },
        "source" => "openmaptiles",
        "source-layer" => "poi",
        "type" => "symbol"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "Point"],
          ["!=", "class", "swimming_pool"],
          [">=", "rank", 7],
          ["<", "rank", 20],
          ["any", ["!has", "level"], ["==", "level", 0]]
        ],
        "id" => "poi_z15",
        "layout" => %{
          "icon-image" => "{class}_11",
          "text-anchor" => "top",
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            "\n",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Roboto Condensed Italic", "Noto Sans Italic"],
          "text-max-width" => 9,
          "text-offset" => [0, 0.6],
          "text-padding" => 2,
          "text-size" => 12,
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 15,
        "paint" => %{
          "text-color" => "#666",
          "text-halo-blur" => 0.5,
          "text-halo-color" => "#ffffff",
          "text-halo-width" => 1
        },
        "source" => "openmaptiles",
        "source-layer" => "poi",
        "type" => "symbol"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "Point"],
          ["!=", "class", "swimming_pool"],
          ["any", ["<", "rank", 7]],
          ["any", ["!has", "level"], ["==", "level", 0]]
        ],
        "id" => "poi_z14",
        "layout" => %{
          "icon-image" => "{class}_11",
          "icon-size" => 0.9,
          "text-anchor" => "top",
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            "\n",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Roboto Condensed Italic", "Noto Sans Italic"],
          "text-max-width" => 9,
          "text-offset" => [0, 0.6],
          "text-padding" => 2,
          "text-size" => 12,
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 14.2,
        "paint" => %{
          "text-color" => "#666",
          "text-halo-blur" => 0.5,
          "text-halo-color" => "#ffffff",
          "text-halo-width" => 1
        },
        "source" => "openmaptiles",
        "source-layer" => "poi",
        "type" => "symbol"
      },
      %{
        "filter" => [
          "all",
          ["in", "class", "bus", "railway", "airport"],
          ["==", "subclass", "station"]
        ],
        "id" => "poi_transit",
        "layout" => %{
          "icon-image" => "{class}_11",
          "icon-size" => 0.9,
          "text-anchor" => "left",
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            "\n",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Roboto Condensed Italic", "Noto Sans Italic"],
          "text-max-width" => 9,
          "text-offset" => [0.9, 0],
          "text-padding" => 2,
          "text-size" => 12,
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 15,
        "paint" => %{
          "text-color" => "rgba(102, 102, 102, 1)",
          "text-halo-blur" => 0.5,
          "text-halo-color" => "#ffffff",
          "text-halo-width" => 1
        },
        "source" => "openmaptiles",
        "source-layer" => "poi",
        "type" => "symbol"
      },
      %{
        "filter" => [
          "all",
          ["==", "oneway", 1],
          [
            "in",
            "class",
            "motorway",
            "trunk",
            "primary",
            "secondary",
            "tertiary",
            "minor",
            "service"
          ]
        ],
        "id" => "road_oneway",
        "layout" => %{
          "icon-image" => "oneway",
          "icon-padding" => 2,
          "icon-rotate" => 90,
          "icon-rotation-alignment" => "map",
          "icon-size" => %{"stops" => [[15, 0.5], [19, 1]]},
          "symbol-placement" => "line",
          "symbol-spacing" => 75,
          "visibility" => "visible"
        },
        "minzoom" => 15,
        "paint" => %{"icon-opacity" => 0.5},
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "symbol"
      },
      %{
        "filter" => [
          "all",
          ["==", "oneway", -1],
          [
            "in",
            "class",
            "motorway",
            "trunk",
            "primary",
            "secondary",
            "tertiary",
            "minor",
            "service"
          ]
        ],
        "id" => "road_oneway_opposite",
        "layout" => %{
          "icon-image" => "oneway",
          "icon-padding" => 2,
          "icon-rotate" => -90,
          "icon-rotation-alignment" => "map",
          "icon-size" => %{"stops" => [[15, 0.5], [19, 1]]},
          "symbol-placement" => "line",
          "symbol-spacing" => 75
        },
        "minzoom" => 15,
        "paint" => %{"icon-opacity" => 0.5},
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "symbol"
      },
      %{
        "filter" => ["all", ["in", "subclass", "gondola", "cable_car"]],
        "id" => "road_gondola_label",
        "layout" => %{
          "symbol-placement" => "line",
          "text-anchor" => "center",
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            " ",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Roboto Italic", "Noto Sans Italic"],
          "text-offset" => [0.8, 0.8],
          "text-size" => %{"base" => 1, "stops" => ['\r\v', [15, 12]]}
        },
        "metadata" => %{},
        "minzoom" => 13,
        "paint" => %{
          "text-color" => "rgba(113, 103, 95, 1)",
          "text-halo-blur" => 0.5,
          "text-halo-color" => "rgba(255, 255, 255, 1)",
          "text-halo-width" => 1
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation_name",
        "type" => "symbol"
      },
      %{
        "filter" => ["all", ["==", "subclass", "ferry"]],
        "id" => "road_ferry_label",
        "layout" => %{
          "symbol-placement" => "line",
          "text-anchor" => "center",
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            " ",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Roboto Italic", "Noto Sans Italic"],
          "text-offset" => [0.8, 0.8],
          "text-size" => %{"base" => 1, "stops" => ['\r\v', [15, 12]]}
        },
        "minzoom" => 12,
        "paint" => %{
          "text-color" => "rgba(46, 126, 168, 1)",
          "text-halo-blur" => 0.5,
          "text-halo-width" => 1
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation_name",
        "type" => "symbol"
      },
      %{
        "filter" => ["all", ["!in", "subclass", "ferry", "gondola", "cable_car"]],
        "id" => "road_label",
        "layout" => %{
          "symbol-placement" => "line",
          "text-anchor" => "center",
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            " ",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Roboto Regular", "Noto Sans Regular"],
          "text-offset" => [0, 0.15],
          "text-size" => %{"base" => 1, "stops" => ['\r\v', [14, 13]]}
        },
        "metadata" => %{},
        "paint" => %{
          "text-color" => "#765",
          "text-halo-blur" => 0.5,
          "text-halo-width" => 1
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation_name",
        "type" => "symbol"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "Point"],
          ["==", "subclass", "junction"],
          [">", "ref_length", 0]
        ],
        "id" => "highway-junction",
        "layout" => %{
          "icon-image" => "circle_8",
          "icon-rotation-alignment" => "viewport",
          "icon-size" => 1,
          "icon-text-fit" => "none",
          "symbol-avoid-edges" => true,
          "symbol-placement" => "point",
          "symbol-spacing" => 200,
          "symbol-z-order" => "auto",
          "text-anchor" => "bottom-left",
          "text-field" => "Exit {ref}",
          "text-font" => ["Noto Sans Regular"],
          "text-justify" => "center",
          "text-offset" => [0.55, -0.4],
          "text-pitch-alignment" => "auto",
          "text-rotation-alignment" => "viewport",
          "text-size" => 10,
          "visibility" => "visible"
        },
        "minzoom" => 15.5,
        "paint" => %{"icon-opacity" => 1, "text-color" => "rgba(79, 77, 77, 1)"},
        "source" => "openmaptiles",
        "source-layer" => "transportation_name",
        "type" => "symbol"
      },
      %{
        "filter" => [
          "all",
          ["<=", "ref_length", 6],
          ["==", "$type", "LineString"],
          ["!in", "network", "us-interstate", "us-highway", "us-state"]
        ],
        "id" => "highway-shield",
        "layout" => %{
          "icon-image" => "road_{ref_length}",
          "icon-rotation-alignment" => "viewport",
          "icon-size" => 1,
          "symbol-avoid-edges" => true,
          "symbol-placement" => %{
            "base" => 1,
            "stops" => [[10, "point"], [11, "line"]]
          },
          "symbol-spacing" => 200,
          "text-field" => "{ref}",
          "text-font" => ["Noto Sans Regular"],
          "text-rotation-alignment" => "viewport",
          "text-size" => 10
        },
        "minzoom" => 8,
        "paint" => %{"text-color" => "rgba(37, 36, 36, 1)"},
        "source" => "openmaptiles",
        "source-layer" => "transportation_name",
        "type" => "symbol"
      },
      %{
        "filter" => [
          "all",
          ["<=", "ref_length", 6],
          ["==", "$type", "LineString"],
          ["in", "network", "us-interstate"]
        ],
        "id" => "highway-shield-us-interstate",
        "layout" => %{
          "icon-image" => "{network}_{ref_length}",
          "icon-rotation-alignment" => "viewport",
          "icon-size" => 1,
          "symbol-avoid-edges" => true,
          "symbol-placement" => %{
            "base" => 1,
            "stops" => [[7, "point"], [7, "line"], [8, "line"]]
          },
          "symbol-spacing" => 200,
          "text-field" => "{ref}",
          "text-font" => ["Noto Sans Regular"],
          "text-rotation-alignment" => "viewport",
          "text-size" => 9
        },
        "minzoom" => 7,
        "paint" => %{"text-color" => "rgba(255, 255, 255, 1)"},
        "source" => "openmaptiles",
        "source-layer" => "transportation_name",
        "type" => "symbol"
      },
      %{
        "filter" => [
          "all",
          ["<=", "ref_length", 6],
          ["==", "$type", "LineString"],
          ["in", "network", "us-highway", "us-state"]
        ],
        "id" => "highway-shield-us-other",
        "layout" => %{
          "icon-image" => "{network}_{ref_length}",
          "icon-rotation-alignment" => "viewport",
          "icon-size" => 1,
          "symbol-avoid-edges" => true,
          "symbol-placement" => %{
            "base" => 1,
            "stops" => [[10, "point"], [11, "line"]]
          },
          "symbol-spacing" => 200,
          "text-field" => "{ref}",
          "text-font" => ["Noto Sans Regular"],
          "text-rotation-alignment" => "viewport",
          "text-size" => 9
        },
        "minzoom" => 9,
        "paint" => %{"text-color" => "rgba(37, 36, 36, 1)"},
        "source" => "openmaptiles",
        "source-layer" => "transportation_name",
        "type" => "symbol"
      },
      %{
        "filter" => ["all", ["has", "iata"]],
        "id" => "airport_label",
        "layout" => %{
          "icon-image" => "airport_11",
          "icon-size" => 1,
          "text-anchor" => "top",
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            "\n",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Noto Sans Regular"],
          "text-max-width" => 9,
          "text-offset" => [0, 0.6],
          "text-optional" => true,
          "text-padding" => 2,
          "text-size" => %{"stops" => ['\b\n', [14, 13]]},
          "visibility" => "visible"
        },
        "minzoom" => 8.5,
        "paint" => %{
          "text-color" => "#666",
          "text-halo-blur" => 0.5,
          "text-halo-color" => "#ffffff",
          "text-halo-width" => 1
        },
        "source" => "openmaptiles",
        "source-layer" => "aerodrome_label",
        "type" => "symbol"
      },
      %{
        "filter" => ["all", ["==", "class", "gate"]],
        "id" => "airport_gate",
        "layout" => %{
          "text-field" => "{ref}",
          "text-font" => ["Roboto Medium", "Noto Sans Regular"],
          "text-size" => %{"stops" => [[17, 9], [19, 15]]}
        },
        "minzoom" => 16.5,
        "paint" => %{
          "text-color" => "rgba(135, 135, 135, 1)",
          "text-halo-color" => "rgba(255, 255, 255, 1)",
          "text-halo-width" => 1.5
        },
        "source" => "openmaptiles",
        "source-layer" => "aeroway",
        "type" => "symbol"
      },
      %{
        "filter" => ["all", ["==", "rank", 1]],
        "id" => "place_park",
        "layout" => %{
          "symbol-avoid-edges" => false,
          "symbol-spacing" => 1250,
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            "\n",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Roboto Condensed Italic", "Noto Sans Italic"],
          "text-letter-spacing" => 0.1,
          "text-max-width" => 9,
          "text-size" => %{"base" => 1.2, "stops" => ['\f\n', [15, 14]]},
          "text-transform" => "none",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 12,
        "paint" => %{
          "text-color" => "rgba(94, 141, 58, 1)",
          "text-halo-blur" => 0.5,
          "text-halo-color" => "rgba(255,255,255,0.8)",
          "text-halo-width" => 1.2
        },
        "source" => "openmaptiles",
        "source-layer" => "park",
        "type" => "symbol"
      },
      %{
        "filter" => [
          "all",
          ["in", "class", "hamlet", "island", "islet", "neighbourhood", "suburb"]
        ],
        "id" => "place_other",
        "layout" => %{
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            "\n",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Roboto Condensed Italic", "Noto Sans Italic"],
          "text-letter-spacing" => 0.1,
          "text-max-width" => 9,
          "text-size" => %{"base" => 1.2, "stops" => ['\f\n', [15, 14]]},
          "text-transform" => "uppercase",
          "visibility" => "visible"
        },
        "metadata" => %{},
        "minzoom" => 8,
        "paint" => %{
          "text-color" => "rgba(66, 62, 62, 1)",
          "text-halo-color" => "rgba(255,255,255,0.8)",
          "text-halo-width" => 1.2
        },
        "source" => "openmaptiles",
        "source-layer" => "place",
        "type" => "symbol"
      },
      %{
        "filter" => ["all", ["==", "class", "village"]],
        "id" => "place_village",
        "layout" => %{
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            "\n",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Roboto Regular", "Noto Sans Regular"],
          "text-max-width" => 8,
          "text-size" => %{"base" => 1.2, "stops" => ['\n\f', [15, 22]]}
        },
        "metadata" => %{},
        "minzoom" => 8,
        "paint" => %{
          "text-color" => "#333",
          "text-halo-color" => "rgba(255,255,255,0.8)",
          "text-halo-width" => 1.2
        },
        "source" => "openmaptiles",
        "source-layer" => "place",
        "type" => "symbol"
      },
      %{
        "filter" => ["all", ["==", "class", "town"]],
        "id" => "place_town",
        "layout" => %{
          "icon-image" => %{
            "base" => 1,
            "stops" => [[0, "circle-stroked_16"], [10, ""]]
          },
          "text-anchor" => "bottom",
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            "\n",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Roboto Regular", "Noto Sans Regular"],
          "text-max-width" => 8,
          "text-offset" => [0, 0],
          "text-size" => %{"base" => 1.2, "stops" => ['\a\f', [11, 16]]}
        },
        "metadata" => %{},
        "minzoom" => 6,
        "paint" => %{
          "text-color" => "#333",
          "text-halo-color" => "rgba(255,255,255,0.8)",
          "text-halo-width" => 1.2
        },
        "source" => "openmaptiles",
        "source-layer" => "place",
        "type" => "symbol"
      },
      %{
        "filter" => ["all", ["==", "class", "state"], ["in", "rank", 3, 4, 5]],
        "id" => "place_region",
        "layout" => %{
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            "\n",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Roboto Medium", "Noto Sans Regular"],
          "text-letter-spacing" => 0.1,
          "text-padding" => 2,
          "text-size" => %{"stops" => [[3, 9], [5, 10], [6, 11]]},
          "text-transform" => "uppercase",
          "visibility" => "visible"
        },
        "maxzoom" => 7,
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "text-color" => "rgba(118, 116, 108, 1)",
          "text-halo-color" => "rgba(255,255,255,0.7)",
          "text-halo-width" => 0.8
        },
        "source" => "openmaptiles",
        "source-layer" => "place",
        "type" => "symbol"
      },
      %{
        "filter" => ["all", ["==", "class", "state"], ["in", "rank", 1, 2]],
        "id" => "place_state",
        "layout" => %{
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            "\n",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Roboto Medium", "Noto Sans Regular"],
          "text-letter-spacing" => 0.1,
          "text-padding" => 2,
          "text-size" => %{"stops" => [[3, 9], [5, 11], [6, 12]]},
          "text-transform" => "uppercase",
          "visibility" => "visible"
        },
        "maxzoom" => 6,
        "metadata" => %{},
        "minzoom" => 3,
        "paint" => %{
          "text-color" => "rgba(118, 116, 108, 1)",
          "text-halo-color" => "rgba(255,255,255,0.7)",
          "text-halo-width" => 0.8
        },
        "source" => "openmaptiles",
        "source-layer" => "place",
        "type" => "symbol"
      },
      %{
        "filter" => ["all", ["==", "class", "city"]],
        "id" => "place_city",
        "layout" => %{
          "icon-allow-overlap" => true,
          "icon-image" => %{
            "base" => 1,
            "stops" => [[0, "circle-stroked_16"], [10, ""]]
          },
          "icon-optional" => false,
          "text-anchor" => "bottom",
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            "\n",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Roboto Medium", "Noto Sans Regular"],
          "text-max-width" => 8,
          "text-offset" => [0, 0],
          "text-size" => %{"base" => 1.2, "stops" => [[7, 14], [11, 24]]}
        },
        "metadata" => %{},
        "minzoom" => 5,
        "paint" => %{
          "text-color" => "#333",
          "text-halo-color" => "rgba(255,255,255,0.8)",
          "text-halo-width" => 1.2
        },
        "source" => "openmaptiles",
        "source-layer" => "place",
        "type" => "symbol"
      },
      %{
        "filter" => ["all", ["==", "class", "country"], ["!has", "iso_a2"]],
        "id" => "country_other",
        "layout" => %{
          "text-field" => "{name:latin}",
          "text-font" => ["Roboto Condensed Italic", "Noto Sans Italic"],
          "text-max-width" => 6.25,
          "text-size" => %{"stops" => [[3, 9], [7, 15]]},
          "text-transform" => "none"
        },
        "metadata" => %{},
        "paint" => %{
          "text-color" => "#334",
          "text-halo-blur" => 1,
          "text-halo-color" => "rgba(255,255,255,0.8)",
          "text-halo-width" => 0.8
        },
        "source" => "openmaptiles",
        "source-layer" => "place",
        "type" => "symbol"
      },
      %{
        "filter" => [
          "all",
          [">=", "rank", 3],
          ["==", "class", "country"],
          ["has", "iso_a2"]
        ],
        "id" => "country_3",
        "layout" => %{
          "text-field" => "{name:latin}",
          "text-font" => ["Roboto Condensed Italic", "Noto Sans Italic"],
          "text-max-width" => 6.25,
          "text-size" => %{"stops" => [[3, 11], [7, 17]]},
          "text-transform" => "none"
        },
        "metadata" => %{},
        "paint" => %{
          "text-color" => "#334",
          "text-halo-blur" => 1,
          "text-halo-color" => "rgba(255,255,255,0.8)",
          "text-halo-width" => 0.8
        },
        "source" => "openmaptiles",
        "source-layer" => "place",
        "type" => "symbol"
      },
      %{
        "filter" => [
          "all",
          ["==", "rank", 2],
          ["==", "class", "country"],
          ["has", "iso_a2"]
        ],
        "id" => "country_2",
        "layout" => %{
          "text-field" => "{name:latin}",
          "text-font" => ["Roboto Condensed Italic", "Noto Sans Italic"],
          "text-max-width" => 6.25,
          "text-size" => %{"stops" => [[2, 11], [5, 17]]},
          "text-transform" => "none"
        },
        "metadata" => %{},
        "paint" => %{
          "text-color" => "#334",
          "text-halo-blur" => 1,
          "text-halo-color" => "rgba(255,255,255,0.8)",
          "text-halo-width" => 0.8
        },
        "source" => "openmaptiles",
        "source-layer" => "place",
        "type" => "symbol"
      },
      %{
        "filter" => [
          "all",
          ["==", "rank", 1],
          ["==", "class", "country"],
          ["has", "iso_a2"]
        ],
        "id" => "country_1",
        "layout" => %{
          "text-field" => "{name:latin}",
          "text-font" => ["Roboto Condensed Italic", "Noto Sans Italic"],
          "text-max-width" => 6.25,
          "text-size" => %{"stops" => [[1, 11], [4, 17], [6, 19]]},
          "text-transform" => "none"
        },
        "metadata" => %{},
        "paint" => %{
          "text-color" => "#334",
          "text-halo-blur" => 1,
          "text-halo-color" => "rgba(255,255,255,0.8)",
          "text-halo-width" => 0.8
        },
        "source" => "openmaptiles",
        "source-layer" => "place",
        "type" => "symbol"
      },
      %{
        "filter" => ["all", ["==", "class", "continent"]],
        "id" => "continent",
        "layout" => %{
          "text-field" => "{name:latin}",
          "text-font" => ["Roboto Condensed Italic", "Noto Sans Italic"],
          "text-justify" => "center",
          "text-size" => 13,
          "text-transform" => "uppercase"
        },
        "maxzoom" => 1,
        "metadata" => %{},
        "paint" => %{
          "text-color" => "#633",
          "text-halo-color" => "rgba(255,255,255,0.7)",
          "text-halo-width" => 1
        },
        "source" => "openmaptiles",
        "source-layer" => "place",
        "type" => "symbol"
      },
      %{
        "id" => "housenumber",
        "layout" => %{
          "text-field" => "{housenumber}",
          "text-font" => ["Roboto Medium", "Noto Sans Regular"],
          "text-size" => 10
        },
        "minzoom" => 17.5,
        "paint" => %{"text-color" => "rgba(119, 102, 85, 0.69)"},
        "source" => "openmaptiles",
        "source-layer" => "housenumber",
        "type" => "symbol"
      }
    ],
    "metadata" => %{
      "maptiler:copyright" =>
        "This style was generated on MapTiler Cloud. Usage outside of MapTiler Cloud requires valid MapTiler Data Package: https://www.maptiler.com/data/package/ -- please contact us."
    },
    "name" => "Streets",
    "pitch" => 0,
    "sources" => %{
      "maptiler_attribution" => %{
        "attribution" =>
          "<a href=\"https://www.maptiler.com/copyright/\" target=\"_blank\">&copy; MapTiler</a> <a href=\"https://www.openstreetmap.org/copyright\" target=\"_blank\">&copy; OpenStreetMap contributors</a>",
        "type" => "vector"
      },
      "openmaptiles" => %{
        "type" => "vector",
        "url" =>
          "https://api.maptiler.com/tiles/v3/tiles.json?key=get_your_own_OpIi9ZULNHzrESv6T2vL"
      }
    },
    "sprite" => "https://api.maptiler.com/maps/streets/sprite",
    "version" => 8,
    "zoom" => 1
  }

  @terrain %{
    "bearing" => 0,
    "center" => [0, 0],
    "glyphs" =>
      "https://api.maptiler.com/fonts/{fontstack}/{range}.pbf?key=get_your_own_OpIi9ZULNHzrESv6T2vL",
    "id" => "hybrid",
    "layers" => [
      %{
        "filter" => ["all"],
        "id" => "satellite",
        "layout" => %{"visibility" => "visible"},
        "minzoom" => 0,
        "paint" => %{"raster-opacity" => 1},
        "source" => "satellite",
        "type" => "raster"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "LineString"],
          ["==", "brunnel", "tunnel"],
          ["in", "class", "motorway", "primary", "secondary", "tertiary", "trunk"]
        ],
        "id" => "tunnel",
        "layout" => %{"line-cap" => "butt", "line-join" => "miter"},
        "paint" => %{
          "line-color" => "rgba(255, 255, 255, 0.2)",
          "line-dasharray" => [0.28, 0.14],
          "line-width" => [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            6,
            0.5,
            20,
            30
          ]
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "LineString"],
          ["in", "class", "path", "track"]
        ],
        "id" => "path",
        "layout" => %{"line-cap" => "square", "line-join" => "bevel"},
        "paint" => %{
          "line-color" => "rgba(247, 247, 247, 0.33)",
          "line-dasharray" => [1, 1],
          "line-width" => [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            14,
            0.5,
            20,
            4
          ]
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "LineString"],
          ["!in", "class", "rail", "ferry", "path", "track"],
          ["!=", "brunnel", "tunnel"]
        ],
        "id" => "road",
        "layout" => %{"line-cap" => "butt", "line-join" => "round"},
        "minzoom" => 6,
        "paint" => %{
          "line-color" => %{
            "stops" => [
              [8, "rgba(255, 255, 255, 0.2)"],
              [14, "rgba(255, 255, 255, 0.4)"],
              [18, "rgba(255, 255, 255, 0.5)"]
            ]
          },
          "line-width" => [
            "interpolate",
            ["linear"],
            ["zoom"],
            5,
            ["match", ["get", "class"], ["motorway", "motorway_link"], 1, 0],
            7,
            ["match", ["get", "class"], ["motorway", "motorway_link"], 1.4, 0],
            8,
            [
              "match",
              ["get", "class"],
              ["motorway", "motorway_link", "primary", "trunk"],
              0.75,
              0
            ],
            9,
            ["match", ["get", "class"], ["secondary", "tertiary"], 0.7, 1],
            10,
            ["match", ["get", "class"], ["motorway", "motorway_link"], 1.3, 1.3],
            14,
            ["match", ["get", "class"], ["minor", "service"], 0.5, 2.4]
          ]
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => ["==", "class", "rail"],
        "id" => "railway",
        "layout" => %{"visibility" => "visible"},
        "minzoom" => 11,
        "paint" => %{
          "line-color" => "rgba(179, 170, 158, 0.2)",
          "line-opacity" => [
            "interpolate",
            ["linear"],
            ["zoom"],
            11,
            0.5,
            16,
            1.3
          ]
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation",
        "type" => "line"
      },
      %{
        "filter" => ["in", "admin_level", 4, 6, 8],
        "id" => "admin_sub",
        "layout" => %{"visibility" => "visible"},
        "minzoom" => 3,
        "paint" => %{
          "line-color" => "rgba(194, 194, 194, 0.5)",
          "line-dasharray" => [2, 1]
        },
        "source" => "openmaptiles",
        "source-layer" => "boundary",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["<=", "admin_level", 2],
          ["==", "$type", "LineString"]
        ],
        "id" => "admin_country-dark",
        "layout" => %{
          "line-cap" => "butt",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "paint" => %{
          "line-color" => "rgba(0, 0, 0, 0.51)",
          "line-offset" => 1,
          "line-width" => [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            3,
            0.5,
            21,
            32
          ]
        },
        "source" => "openmaptiles",
        "source-layer" => "boundary",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["<=", "admin_level", 2],
          ["==", "$type", "LineString"]
        ],
        "id" => "admin_country",
        "layout" => %{
          "line-cap" => "round",
          "line-join" => "round",
          "visibility" => "visible"
        },
        "paint" => %{
          "line-color" => "rgba(226, 226, 226, 1)",
          "line-width" => [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            3,
            0.5,
            21,
            32
          ]
        },
        "source" => "openmaptiles",
        "source-layer" => "boundary",
        "type" => "line"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "LineString"],
          ["!=", "subclass", "ferry"]
        ],
        "id" => "road_label",
        "layout" => %{
          "symbol-placement" => "line",
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            " ",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Noto Sans Regular"],
          "text-letter-spacing" => 0.1,
          "text-rotation-alignment" => "map",
          "text-size" => [
            "interpolate",
            ["linear", 0.75, 1, 0.75, 1],
            ["zoom"],
            10,
            8,
            15,
            9
          ],
          "text-transform" => "none"
        },
        "paint" => %{
          "text-color" => "rgba(255, 255, 255, 1)",
          "text-halo-color" => "rgba(43, 43, 43, 1)",
          "text-halo-width" => 1
        },
        "source" => "openmaptiles",
        "source-layer" => "transportation_name",
        "type" => "symbol"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "Point"],
          ["!in", "class", "country", "state"]
        ],
        "id" => "place_label",
        "layout" => %{
          "text-field" => [
            "concat",
            ["get", "name:latin"],
            "\n",
            ["get", "name:nonlatin"]
          ],
          "text-font" => ["Noto Sans Regular"],
          "text-max-width" => 10,
          "text-size" => [
            "interpolate",
            ["linear", 0.5, 1, 0.5, 1],
            ["zoom"],
            3,
            ["match", ["get", "class"], "city", 11, 10],
            6,
            ["match", ["get", "class"], "city", 14.5, 11],
            8,
            ["match", ["get", "class"], "city", 16, 12],
            10,
            ["match", ["get", "class"], "city", 20, 13]
          ]
        },
        "maxzoom" => 16,
        "minzoom" => 3,
        "paint" => %{
          "text-color" => "rgba(255, 255, 255, 1)",
          "text-halo-blur" => 0.5,
          "text-halo-color" => "rgba(0, 0, 0, 1)",
          "text-halo-width" => 1
        },
        "source" => "openmaptiles",
        "source-layer" => "place",
        "type" => "symbol"
      },
      %{
        "filter" => [
          "all",
          ["==", "$type", "Point"],
          ["in", "class", "state"],
          ["<", "rank", 3]
        ],
        "id" => "state_label",
        "layout" => %{
          "text-field" => "{name:latin}",
          "text-font" => ["Noto Sans Italic"],
          "text-max-width" => 10,
          "text-size" => [
            "interpolate",
            ["linear", 0.75, 1, 0.75, 1],
            ["zoom"],
            1,
            ["step", ["get", "rank"], 13, 1, 12, 2, 12],
            4,
            ["step", ["get", "rank"], 15, 1, 13, 2, 13],
            6,
            ["step", ["get", "rank"], 23, 1, 17, 2, 17],
            9,
            ["step", ["get", "rank"], 27, 1, 20, 2, 20]
          ]
        },
        "maxzoom" => 12,
        "minzoom" => 3,
        "paint" => %{
          "text-color" => "rgba(255, 255, 255, 1)",
          "text-halo-blur" => 1,
          "text-halo-color" => "rgba(0, 0, 0, 1)",
          "text-halo-width" => 1
        },
        "source" => "openmaptiles",
        "source-layer" => "place",
        "type" => "symbol"
      },
      %{
        "filter" => ["all", ["==", "$type", "Point"], ["in", "class", "country"]],
        "id" => "country_label",
        "layout" => %{
          "text-field" => "{name:latin}",
          "text-font" => ["Noto Sans Bold"],
          "text-max-width" => 10,
          "text-size" => [
            "interpolate",
            ["linear", 0.75, 1, 0.75, 1],
            ["zoom"],
            1,
            ["step", ["get", "rank"], 13, 1, 12, 2, 12],
            4,
            ["step", ["get", "rank"], 15, 1, 14, 2, 14],
            6,
            ["step", ["get", "rank"], 23, 1, 18, 2, 18],
            9,
            ["step", ["get", "rank"], 27, 1, 22, 2, 22]
          ]
        },
        "maxzoom" => 12,
        "paint" => %{
          "text-color" => "rgba(255, 255, 255, 1)",
          "text-halo-blur" => 1,
          "text-halo-color" => "rgba(0, 0, 0, 1)",
          "text-halo-width" => 1
        },
        "source" => "openmaptiles",
        "source-layer" => "place",
        "type" => "symbol"
      }
    ],
    "metadata" => %{
      "maptiler:copyright" =>
        "This style was generated on MapTiler Cloud. Usage outside of MapTiler Cloud requires valid MapTiler Data Package: https://www.maptiler.com/data/package/ -- please contact us."
    },
    "name" => "Satellite Hybrid",
    "pitch" => 0,
    "sources" => %{
      "openmaptiles" => %{
        "type" => "vector",
        "url" =>
          "https://api.maptiler.com/tiles/v3/tiles.json?key=get_your_own_OpIi9ZULNHzrESv6T2vL"
      },
      "satellite" => %{
        "tileSize" => 512,
        "type" => "raster",
        "url" =>
          "https://api.maptiler.com/tiles/satellite-v2/tiles.json?key=get_your_own_OpIi9ZULNHzrESv6T2vL"
      }
    },
    "version" => 8,
    "zoom" => 1
  }

  def style(:default), do: @default
  def style(:street), do: @street
  def style(:terrain), do: @terrain

  def style(style),
    do:
      raise(
        ArgumentError,
        "unknown style #{inspect(style)}, the available styles are :default, :terrain and :street"
      )
end
