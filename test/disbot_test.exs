defmodule DisbotTest do
  use ExUnit.Case
  doctest Disbot

  test "greets the world" do
    assert Disbot.hello() == :world
  end
end
