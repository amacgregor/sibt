defmodule SibtWeb.Plugs.SetViewRegistry do
  @moduledoc """
  Track the view counter as part of the session data
  """
  import Plug.Conn

  def init(_params) do
  end

  def call(conn, _params) do
    if conn.assigns[:views] do
      conn
    else
      views_registry = get_session(conn, :views)

      if views_registry == nil do
        conn
        |> put_session(:views, %{})
        |> assign(:views, %{})
      else
        conn =
          conn
          |> assign(:views, views_registry)
      end
    end
  end
end
