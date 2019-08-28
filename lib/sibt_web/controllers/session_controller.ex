defmodule SibtWeb.SessionController do
  @moduledoc false
  use SibtWeb, :controller
  plug Ueberauth

  alias Sibt.{Accounts, Repo, User}

  def create(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    {:ok, changeset} = Accounts.prepare_authenticated_user_changeset(auth)

    case insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Thank you for signing in!")
        |> put_session(:user_id, user.id)
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, reason} ->
        Sentry.capture_message("auth_failure",
          extra: %{extra: "Insert failed: #{inspect(reason.errors)}"}
        )

        conn
        |> put_flash(:error, "There was an Error during Sign in.")
        |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def delete(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: Routes.page_path(conn, :index))
  end

  defp insert_or_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)

      user ->
        {:ok, user}
    end
  end
end
