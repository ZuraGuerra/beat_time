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

  ## Examples

      iex> BeatTime.now()
      %BeatTime{300}
  """
  @spec now() :: BeatTime.t(integer)
  def now() do
    current =
      DateTime.utc_now()
      |> Dumballah.Convert.to_unix()
      |> Dumballah.Calculate.add_time(:hours, 1) # UTC+01

    beats =
      current
      |> calculate_seconds_since_midnight()
      |> seconds_to_beats()

    %BeatTime{value: beats}
  end

  defp to_date_tuple(datetime), do: {datetime.year, datetime.month, datetime.day}

  defp seconds_to_beats(seconds), do: (seconds * 1000) |> div(@beat)

  defp calculate_seconds_since_midnight(unix_time) do
    day_start =
      unix_time
      |> Dumballah.Convert.from_unix()
      |> to_date_tuple()
      |> Dumballah.Calculate.date_from_dawn()

    unix_time - day_start
  end
end
