defmodule Sibt.Operation do
  @moduledoc """
  The Operation context.
  """

  import Ecto.Query, warn: false
  alias Sibt.Repo

  alias Sibt.Operation.Project

  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects do
    Project
    |> Repo.all()
    |> Repo.preload(:user)
  end

  @spec list_projects(any) :: any
  def list_projects(user_id) do
    Repo.all(
      from m in Project,
        join: a in assoc(m, :user),
        where: a.id == ^user_id,
        preload: [user: a]
    )
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project!(id) do
    id
    |> (&Repo.get!(Project, &1)).()
    |> Repo.preload(:user)
  end

  @doc """
  Get a Single project by the project_id / project_code

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project_by_code!("valid_code")
      %Project{}

      iex> get_project_by_code!("invalid_code")
      ** (Ecto.NoResultsError)

  """
  @spec get_project_by_code!(any) :: nil | [%{optional(atom) => any}] | %{optional(atom) => any}
  def get_project_by_code!(code) do
    code
    |> (&Repo.get_by!(Project, project_id: &1)).()
    |> Repo.preload(:user)
  end

  @spec increment_project_view_counter(any) :: any
  def increment_project_view_counter(code) do
    from(p in Project, where: p.project_id == ^code, update: [inc: [view_count: 1]])
    |> Repo.update_all([])
  end

  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(user, attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:user, user)
    |> Repo.insert()
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{source: %Project{}}

  """
  def change_project(%Project{} = project) do
    Project.changeset(project, %{})
  end
end
