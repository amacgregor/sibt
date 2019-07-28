# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sibt,
  ecto_repos: [Sibt.Repo]

# Configures the endpoint
config :sibt, SibtWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xWDRTt86de00RBMad/z9EkRbxy8vy+4aJVvRLFA2TMW0DKYgYAymcght2OkUj07N",
  render_errors: [view: SibtWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Sibt.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Authentication Providers
config :ueberauth, Ueberauth,
  providers: [
    facebook:
      {Ueberauth.Strategy.Facebook,
       [
         profile_fields: "name,email,first_name,last_name"
       ]},
    github:
      {Ueberauth.Strategy.Github,
       [
         profile_fields: "name,email,first_name,last_name"
       ]}
  ]

config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
  client_id: System.get_env("FACEBOOK_CLIENT_ID"),
  client_secret: System.get_env("FACEBOOK_CLIENT_SECRET")

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET")

config :sentry,
  dsn: "https://cbb67e5040584a42a9959d5bdb4916ff@sentry.io/1515433",
  enable_source_code_context: true,
  root_source_code_path: File.cwd!(),
  included_environments: ~w(production staging),
  environment_name: System.get_env("RELEASE_LEVEL") || "development"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
