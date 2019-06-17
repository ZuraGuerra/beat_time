defmodule BeatTime do
  @moduledoc """
  Utilities to work with Swatch Internet Time (.beat time).

  * Every day has 1000.beats.
  * Every .beat has 86_400 milliseconds.
  * There's no notion of time zones: it's an universal time system based on UTC+01.
  """
  defstruct value: 0
  @type t(integer) :: {integer}

  @beat 86_400

  @doc """
  Returns the current .beat time.
  """
  @spec now() :: BeatTime.t(integer)
  def now() do
    DateTime.utc_now()
    |> Dumballah.Convert.to_unix()
    |> to_beats()
  end

  @doc """
  Returns the .beat time representation of a given UNIX time.
  """
  @spec to_beats(integer) :: BeatTime.t(integer)
  def to_beats(current) do
    beats =
      current
      |> Dumballah.Calculate.add_time(:hours, 1) # UTC+01
      |> calculate_seconds_since_midnight()
      |> Kernel.*(1000)
      |> div(@beat)

    %BeatTime{value: beats}
  end

  @doc """
  Returns the text representation of a .beat time.
  """
  @spec format(BeatTime.t(integer)) :: String.t()
  def format(beat_time), do: "@#{beat_time.value}"

  defp to_date_tuple(datetime), do: {datetime.year, datetime.month, datetime.day}

  defp calculate_seconds_since_midnight(unix_time) do
    day_start =
      unix_time
      |> Dumballah.Convert.from_unix()
      |> to_date_tuple()
      |> Dumballah.Calculate.date_from_dawn()

    unix_time - day_start
  end
end
