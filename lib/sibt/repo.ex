defmodule Sibt.Repo do
  use Ecto.Repo,
    otp_app: :sibt,
    adapter: Ecto.Adapters.Postgres
end
