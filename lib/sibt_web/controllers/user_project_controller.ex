defmodule SibtWeb.UserProjectController do
  use SibtWeb, :controller

  alias Sibt.Operation
  alias Sibt.Operation.Project

  plug SibtWeb.Plugs.RegisterView when action in [:show]

  def index(conn, _params) do
    current_user = conn.assigns[:user]

    rows =
      current_user.id
      |> Operation.list_projects()
      |> Enum.chunk_every(3)

    render(conn, "index.html", rows: rows)
  end

  def new(conn, _params) do
    changeset = Operation.change_project(%Project{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"project" => project_params}) do
    case Operation.create_project(conn.assigns.user, project_params) do
      {:ok, project} ->
        conn
        |> put_flash(:info, "Project created successfully.")
        |> redirect(to: Routes.project_path(conn, :show, project.project_id))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Operation.get_project!(id)
    render(conn, "show.html", project: project)
  end

  def show(conn, %{"project_code" => project_code}) do
    project = Operation.get_project_by_code!(project_code)
    render(conn, "show.html", project: project)
  end

  def edit(conn, %{"id" => id}) do
    project = Operation.get_project!(id)
    changeset = Operation.change_project(project)
    render(conn, "edit.html", project: project, changeset: changeset)
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Operation.get_project!(id)

    case Operation.update_project(project, project_params) do
      {:ok, project} ->
        conn
        |> put_flash(:info, "Project updated successfully.")
        |> redirect(to: Routes.project_path(conn, :show, project.project_id))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", project: project, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Operation.get_project!(id)
    {:ok, _project} = Operation.delete_project(project)

    conn
    |> put_flash(:info, "Project deleted successfully.")
    |> redirect(to: Routes.project_path(conn, :index))
  end
end
