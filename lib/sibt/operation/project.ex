defmodule Sibt.Operation.Project do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset


  schema "projects" do
    field :description, :string
    field :like_count, :integer
    field :project_id, :string
    field :subscriber_count, :integer
    field :thumbnail, :string
    field :title, :string
    field :view_count, :integer
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:project_id, :title, :description, :thumbnail, :view_count, :like_count, :subscriber_count])
    |> validate_required([:project_id, :title, :description, :thumbnail, :view_count, :like_count, :subscriber_count])
  end
end
