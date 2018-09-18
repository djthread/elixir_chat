# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :elixir_chat, ElixirChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5hqs0ckt5IM+6xEDVQ3rvsqO7HZdqw3oqiDBZHqQJ32kEmHpgh3QHeNvQZKl0XrT",
  render_errors: [view: ElixirChatWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirChat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
