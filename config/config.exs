# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :renter,
  ecto_repos: [Renter.Repo]

# Configures the endpoint
config :renter, Renter.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "r47VKrV66DDYwUHWlRY2rj2pKYCLpaMnimu1uAQUgX0MWB3Nhtunez9whkGH8SfT",
  render_errors: [view: Renter.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Renter.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
