defmodule SibtWeb.PageController do
  use SibtWeb, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end
end
