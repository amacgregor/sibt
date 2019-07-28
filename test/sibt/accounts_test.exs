defmodule Sibt.AccountsTest do
  use Sibt.DataCase

  alias Sibt.Accounts

  describe "users" do
    alias Sibt.User

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    @ueberauth_github_auth %Ueberauth.Auth{
      credentials: %{token: "asdf12334567890"},
      info: %{email: "tony@thetiger.com", name: "Tony Stark"},
      provider: :github
    }

    def github_user_fixture() do
      user_params = %{
        email: "tony@thetiger.com",
        first_name: "Tony",
        last_name: "Stark",
        provider: "github",
        token: "asdf12334567890"
      }

      {:ok, User.changeset(%User{}, user_params)}
    end

    def users_fixture(attrs \\ %{}) do
      {:ok, users} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_users()

      users
    end

    test "prepare_authenticated_user_changeset/1 returns a valid changeset" do
      assert Accounts.prepare_authenticated_user_changeset(@ueberauth_github_auth) ==
               github_user_fixture()
    end

    test "list_users/0 returns all users" do
      users = users_fixture()
      assert Accounts.list_users() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Accounts.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      assert {:ok, %User{} = users} = Accounts.create_users(@valid_attrs)
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      assert {:ok, %User{} = users} = Accounts.update_users(users, @update_attrs)
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_users(users, @invalid_attrs)
      assert users == Accounts.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %User{}} = Accounts.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Accounts.change_users(users)
    end
  end
end
