defmodule SibtWeb.Plugs.RegisterView do
  @moduledoc """
  Register the project view against a particular project
  """

  import Plug.Conn

  require Logger

  alias Sibt.{Repo, User, Operation}

  def init(_params) do
  end

  def call(conn, _params) do
    views_map = conn.assigns[:views]
    current_page = conn.params["project_code"]

    if Map.has_key?(views_map, current_page) do
      current_map =
        views_map
        |> Map.take([current_page])
        |> Enum.map(fn {code, counter} -> {code, counter + 1} end)
        |> Enum.into(%{})

      views_map = Map.merge(views_map, current_map)

      conn =
        conn
        |> put_session(:views, views_map)
        |> assign(:views, views_map)
    else
      current_map = %{current_page => 1}
      views_map = Map.merge(views_map, current_map)

      Operation.increment_project_view_counter(current_page)

      conn =
        conn
        |> put_session(:views, views_map)
        |> assign(:views, views_map)
    end
  end
end
