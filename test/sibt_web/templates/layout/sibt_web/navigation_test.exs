defmodule SibtWeb.NavigationTest do
  @moduledoc false
  use SibtWeb.ConnCase

  test "shows a sign in with Facebook link when not sign in", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Sign in with Facebook"
  end

  test "shows a sign in with Github link when not sign in", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Sign in with Github"
  end

  test "shows a sign out link when the user is signed in", %{conn: conn} do
    user = user_fixture()

    conn =
      conn
      |> assign(:user, user)
      |> get("/")

    assert html_response(conn, 200) =~ "Sign Out"
  end
end
