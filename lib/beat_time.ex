defmodule BeatTime do
  @moduledoc """
  Utilities to work with Swatch Internet Time (.beat time).

  * Every day has 1000.beats.
  * Every .beat has 86_400 milliseconds.
  * There's no notion of time zones: it's an universal time system based on UTC+01.
  """
  defstruct value: 0
  @type t(value) :: %BeatTime{integer}

  @doc """
  Returns the current .beat time.

  ## Examples

      iex> BeatTime.now()
      %BeatTime{300}
  """
  @spec now() :: BeatTime.t(integer)
  def now() do
    
  end

end
