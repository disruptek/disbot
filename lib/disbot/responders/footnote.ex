defmodule Disbot.Responders.Footnote do
  use Hedwig.Responder

  def start_link(mod, arg) do
    Hedwig.Responder.start_link(mod, arg)
  end

  @usage "use a ~term, get a definition"
  hear ~r/~(\w+)/, msg do
    note = %Hedwig.Message{
      robot: msg.robot,
      type: "groupchat",
      room: msg.room,
    }
    msg.matches
    |> MapSet.new(fn {index, [rx, term]} ->
      {rx, term}
    end)
    |> Enum.map(fn {_rx, term} ->
      send(note, "i haven't learned how to define `#{term}` yet. 🙁")
      #:ok = reply msg, "i haven't learned how to define `#{v}` yet. 🙁"
    end)
    :ok
  end
end
