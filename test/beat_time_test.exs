defmodule BeatTimeTest do
  use ExUnit.Case
  doctest BeatTime

  test "returns time in beats" do
    unix_time = 1_560_794_022
    expected_beats = 787

    assert BeatTime.to_beats(unix_time) == %BeatTime{value: expected_beats}
  end

  test "formats beat time" do
    beats = 787
    beat_time = %BeatTime{value: beats}

    assert BeatTime.format(beat_time) == "@#{beats}"
  end
end
