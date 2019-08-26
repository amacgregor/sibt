defmodule SibtWeb.ProjectControllerTest do
  use SibtWeb.ConnCase

  alias Sibt.Operation

  @create_attrs %{
    description: "some description",
    like_count: 42,
    project_id: "some-project-id",
    subscriber_count: 42,
    thumbnail: "some thumbnail",
    title: "some title",
    view_count: 42
  }
  @update_attrs %{
    description: "some updated description",
    like_count: 43,
    project_id: "some-project-id",
    subscriber_count: 43,
    thumbnail: "some updated thumbnail",
    title: "some updated title",
    view_count: 43
  }
  @invalid_attrs %{
    description: nil,
    like_count: nil,
    project_id: nil,
    subscriber_count: nil,
    thumbnail: nil,
    title: nil,
    view_count: nil
  }

  def fixture(:project) do
    user = user_fixture()
    {:ok, project} = Operation.create_project(user, @create_attrs)
    project
  end

  # TODO: Fix test dependency on user session
  # describe "index" do
  #   test "lists all projects", %{conn: conn} do
  #     conn = get(conn, Routes.project_path(conn, :index))
  #     assert html_response(conn, 200) =~ "Your Projects"
  #   end
  # end

  describe "new project" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.project_path(conn, :new))
      assert html_response(conn, 200) =~ "Create a Side Project"
    end
  end

  describe "create project" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.project_path(conn, :create), project: @create_attrs)

      assert %{project_code: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.project_path(conn, :show, id)

      conn = get(conn, Routes.project_path(conn, :show, id))
      assert html_response(conn, 200) =~ "some title"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.project_path(conn, :create), project: @invalid_attrs)
      assert html_response(conn, 200) =~ "Create a Side Project"
    end
  end

  describe "edit project" do
    setup [:create_project]

    test "renders form for editing chosen project", %{conn: conn, project: project} do
      conn = get(conn, Routes.project_path(conn, :edit, project))
      assert html_response(conn, 200) =~ "Edit Project"
    end
  end

  describe "update project" do
    setup [:create_project]

    test "redirects when data is valid", %{conn: conn, project: project} do
      conn = put(conn, Routes.project_path(conn, :update, project), project: @update_attrs)
      assert redirected_to(conn) == Routes.project_path(conn, :show, project.project_id)

      conn = get(conn, Routes.project_path(conn, :show, project.project_id))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, project: project} do
      conn = put(conn, Routes.project_path(conn, :update, project), project: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Project"
    end
  end

  describe "delete project" do
    setup [:create_project]

    test "deletes chosen project", %{conn: conn, project: project} do
      conn = delete(conn, Routes.project_path(conn, :delete, project))
      assert redirected_to(conn) == Routes.project_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.project_path(conn, :show, project))
      end
    end
  end

  defp create_project(_) do
    project = fixture(:project)
    {:ok, project: project}
  end
end
