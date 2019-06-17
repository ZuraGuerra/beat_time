# .beat Time

[![Hex version](https://img.shields.io/hexpm/v/beat_time.svg)](https://hex.pm/packages/beat_time)

Utilities to work with [Swatch Internet Time](https://en.wikipedia.org/wiki/Swatch_Internet_Time) (.beat time).

* Every day has 1000.beats.
* Every .beat has 86_400 milliseconds.
* There's no notion of time zones: it's an universal time system based on UTC+01.

## Installation

```elixir
def deps do
  [
    {:beat_time, "~> 1.0.0"}
  ]
end
```

## Usage

```elixir
  iex> BeatTime.now()
  %BeatTime{value: 300}

  iex> BeatTime.now() |> BeatTime.format()
  "@300"
```
