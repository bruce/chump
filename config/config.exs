# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :chump,
  ecto_repos: [Chump.Repo]

# Configures the endpoint
config :chump, Chump.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XnAkCQVleIZCzZPl87ZSMPucgNtVhPwV9cDsOmrgCrHiY3wvUj/zqmQ6iKrwtAY2",
  render_errors: [view: Chump.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Chump.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
