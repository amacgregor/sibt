defmodule Sibt.Operation.Project do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :description, :string
    field :summary, :string
    field :like_count, :integer, default: 0
    field :project_id, :string
    field :subscriber_count, :integer, default: 0
    field :thumbnail, :string
    field :title, :string
    field :view_count, :integer, default: 0
    belongs_to(:user, Sibt.User)

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [
      :project_id,
      :title,
      :description,
      :summary,
      :thumbnail,
      :view_count,
      :like_count,
      :subscriber_count
    ])
    |> validate_required([
      :project_id,
      :title,
      :description
    ])
    |> unique_constraint(:project_id)
  end
end
