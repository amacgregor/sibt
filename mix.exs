defmodule Sibt.MixProject do
  use Mix.Project

  @version "0.4.2"

  def project do
    [
      app: :sibt,
      version: @version,
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Sibt.Application, []},
      extra_applications: [
        :logger,
        :ueberauth,
        :ueberauth_facebook,
        :ueberauth_github,
        :runtime_tools
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.0"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_ecto, "~> 4.0"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:poison, "~> 3.1"},
      {:plug_cowboy, "~> 2.0"},
      {:ueberauth, "~> 0.5"},
      {:ueberauth_facebook, "~> 0.7"},
      {:ueberauth_github, "~> 0.7"},
      {:credo, "~> 1.0"},
      {:git_ops, "~> 0.6.0", only: [:dev]},
      {:faker, "~> 0.11", only: [:test, :dev]}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"],
      release: ["git_ops.release", "cmd git push --follow-tags"],
      "release.test": ["git_ops.release --dry-run"]
    ]
  end
end
