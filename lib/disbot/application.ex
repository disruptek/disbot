defmodule Disbot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Disbot.Worker.start_link(arg)
      # {Disbot.Worker, arg}
      {Disbot.Robot, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Disbot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
