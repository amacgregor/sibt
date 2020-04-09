defmodule Sibt.Repo.Migrations.AddGravatarToUsers do
  use Ecto.Migration

  def up do
    alter table(:users) do
      add :gravatar_url, :string
    end
  end
end
