defmodule Sibt.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :project_id, :string
      add :title, :string
      add :description, :string
      add :thumbnail, :string
      add :view_count, :integer
      add :like_count, :integer
      add :subscriber_count, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:projects, [:user_id])
  end
end
