defmodule Sibt.OperationTest do
  use Sibt.DataCase

  alias Sibt.Operation

  describe "projects" do
    alias Sibt.Operation.Project

    @valid_attrs %{
      description: "some description",
      like_count: 42,
      project_id: "some project_id",
      subscriber_count: 42,
      thumbnail: "some thumbnail",
      title: "some title",
      view_count: 42
    }
    @update_attrs %{
      description: "some updated description",
      like_count: 43,
      project_id: "some updated project_id",
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

    def project_fixture(attrs \\ %{}) do
      user = user_fixture()

      project_params =
        attrs
        |> Enum.into(@valid_attrs)

      {:ok, project} = Operation.create_project(user, project_params)

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Operation.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Operation.get_project!(project.id) == project
    end

    test "create_project/2 with valid data creates a project" do
      user = user_fixture()

      assert {:ok, %Project{} = project} = Operation.create_project(user, @valid_attrs)
      assert project.description == "some description"
      assert project.like_count == 42
      assert project.project_id == "some project_id"
      assert project.subscriber_count == 42
      assert project.thumbnail == "some thumbnail"
      assert project.title == "some title"
      assert project.view_count == 42
    end

    test "create_project/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Operation.create_project(user, @invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, %Project{} = project} = Operation.update_project(project, @update_attrs)
      assert project.description == "some updated description"
      assert project.like_count == 43
      assert project.project_id == "some updated project_id"
      assert project.subscriber_count == 43
      assert project.thumbnail == "some updated thumbnail"
      assert project.title == "some updated title"
      assert project.view_count == 43
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Operation.update_project(project, @invalid_attrs)
      assert project == Operation.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Operation.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Operation.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Operation.change_project(project)
    end
  end
end
