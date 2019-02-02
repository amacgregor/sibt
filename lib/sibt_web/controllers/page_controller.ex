defmodule SibtWeb.PageController do
  use SibtWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
