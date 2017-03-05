# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :chainex, Chainex.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rWl/56cVZtCqcWBu3NBxbF1Kl7SFtoRRX+p0EIq2pMS02qYIa3aacRaZDNAMRHCU",
  render_errors: [view: Chainex.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Chainex.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
