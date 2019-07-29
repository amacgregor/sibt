defmodule Sibt.Repo.Migrations.UpdateProjectsTable do
  use Ecto.Migration

  def up do
    alter table(:projects) do
      add :summary, :string

    end
  end
end
