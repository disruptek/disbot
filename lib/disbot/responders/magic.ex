defmodule Disbot.Responders.Magic8Ball do
  use Hedwig.Responder

  @answers [
    "it is certain.",
    "it is decidedly so.",
    "without a doubt.",
    "yes -- definitely.",
    "you may rely on it.",
    "as i see it, yes.",
    "most likely.",
    "outlook good.",
    "yes.",
    "signs point to yes.",
    "reply hazy, try again.",
    "ask again later.",
    "better not tell you now.",
    "cannot predict now.",
    "concentrate and ask again.",
    "don't count on it.",
    "my reply is no.",
    "my sources say no.",
    "outlook not so good.",
    "very doubtful."
  ]

  @usage "ask a stupid question, get a stupid answer"
  respond ~r/.*\?\s*$/i, msg do
    reply msg, random(@answers)
  end
end
