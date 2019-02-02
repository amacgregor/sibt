defmodule SibtWeb.PageControllerTest do
  use SibtWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to ShouldIBuildThat!"
  end
end
