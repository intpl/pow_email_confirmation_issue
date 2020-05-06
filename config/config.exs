# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :example_confirmation_issue,
  ecto_repos: [ExampleConfirmationIssue.Repo]

# Configures the endpoint
config :example_confirmation_issue, ExampleConfirmationIssueWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "APp8zbEKudEO1sHbPjPixKl5+EpBMpR9JudWIN/I1xOenWsIHS6xkRxYiku6Wpkg",
  render_errors: [view: ExampleConfirmationIssueWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ExampleConfirmationIssue.PubSub,
  live_view: [signing_salt: "mqcop8aV"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :example_confirmation_issue, ExampleConfirmationIssue.Pow.Mailer, adapter: Bamboo.LocalAdapter

config :example_confirmation_issue, :pow,
  user: ExampleConfirmationIssue.Users.User,
  repo: ExampleConfirmationIssue.Repo,
  extensions: [PowEmailConfirmation],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: ExampleConfirmationIssue.Pow.Mailer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
