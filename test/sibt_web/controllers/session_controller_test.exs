defmodule SibtWeb.SessionControllerTest do
  use ExUnit.Case
  use SibtWeb.ConnCase

  alias SibtWeb.SessionController
  alias Sibt.{Repo, User}


  @ueberauth_facebook_auth %{
    credentials: %{token: "asdf12334567890"},
    info: %{email: "tony@thetiger.com", first_name: "Tony", last_name: "Stark"},
    provider: :facebook
  }

  @ueberauth_github_auth %{
    credentials: %{token: "asdf12334567890"},
    info: %{email: "tony@thetiger.com", first_name: "Tony", last_name: "Stark"},
    provider: :github
  }

  test "module exists" do
    assert is_list(SessionController.module_info())
  end

  test "redirects the user to Facebook for authentication", %{conn: conn} do
    conn = get conn, "/auth/facebook"
    assert redirected_to(conn, 302)
  end

  test "redirects the user to Github for authentication", %{conn: conn} do
    conn = get conn, "/auth/github"
    assert redirected_to(conn, 302)
  end

  test "creates user from Facebook information", %{conn: conn} do
    conn = conn
    |> assign(:ueberauth_auth, @ueberauth_facebook_auth)
    |> get("/auth/facebook/callback")

    users = User |> Repo.all
    assert Enum.count(users) == 1
    assert get_flash(conn, :info) == "Thank you for signing in!"
  end

  test "creates user from Github information", %{conn: conn} do
    conn = conn
    |> assign(:ueberauth_auth, @ueberauth_github_auth)
    |> get("/auth/github/callback")

    users = User |> Repo.all
    assert Enum.count(users) == 1
    assert get_flash(conn, :info) == "Thank you for signing in!"
  end

  test "signs out user", %{conn: conn} do
    user = user_fixture()

    conn =
      conn
      |> assign(:user, user)
      |> get("/auth/signout")
      |> get("/")

    assert conn.assigns.user == nil
  end

end
