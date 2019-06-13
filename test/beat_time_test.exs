defmodule BeatTimeTest do
  use ExUnit.Case
  doctest BeatTime

  test "greets the world" do
    assert BeatTime.hello() == :world
  end
end
