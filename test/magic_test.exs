defmodule Disbot.Responders.MagicTest do
  use Hedwig.RobotCase

  @tag start_robot: true, name: "disbot",
       responders: [{Disbot.Responders.Magic8Ball, []}]

  test "magic 8ball", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "disbot: are you awake?"}}
    assert_receive {:message, %{text: text}}
    assert String.contains?(text, " ")
  end
end
