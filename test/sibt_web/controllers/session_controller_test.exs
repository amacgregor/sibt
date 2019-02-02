defmodule SibtWeb.SessionControllerTest do
  use ExUnit.Case
  use SibtWeb.ConnCase

  alias SibtWeb.SessionController


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
end
