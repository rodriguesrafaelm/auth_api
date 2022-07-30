defmodule AuthApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      AuthApi.Repo,
      # Start the Telemetry supervisor
      AuthApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AuthApi.PubSub},
      # Start the Endpoint (http/https)
      AuthApiWeb.Endpoint
      # Start a worker by calling: AuthApi.Worker.start_link(arg)
      # {AuthApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AuthApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AuthApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
