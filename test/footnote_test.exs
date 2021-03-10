defmodule Disbot.Responders.FootnoteTest do
  use Hedwig.RobotCase

  @tag start_robot: true, name: "disbot",
       responders: [{Disbot.Responders.Footnote, []}]

  test "footnotes", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "tell me about ~foo and ~bar"}}
    assert_receive {:message, %{text: text}}
    assert String.contains?(text, "`foo`") or String.contains?(text, "`bar`")
  end
end
