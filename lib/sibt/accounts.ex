defmodule Sibt.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  import Exgravatar

  alias Sibt.{Repo, User}

  require Logger

  @doc """
  Takes a Ueberauth map and returns a valid user Changeset
  """
  @spec prepare_authenticated_user_changeset(Ueberauth.Auth.t()) :: {:ok, Ecto.Changeset.t()}
  def prepare_authenticated_user_changeset(
        %Ueberauth.Auth{credentials: credentials, info: info, provider: :github} = auth
      ) do
    names = String.split(info.name)

    user_params = %{
      token: credentials.token,
      first_name: Enum.at(names, 0),
      last_name: Enum.at(names, 1),
      email: info.email,
      gravatar_url:  Exgravatar.gravatar_url(info.email, s: 256),
      provider: Atom.to_string(auth.provider)
    }

    {:ok, User.changeset(%User{}, user_params)}
  end

  def prepare_authenticated_user_changeset(
        %Ueberauth.Auth{credentials: credentials, info: info, provider: :facebook} = auth
      ) do
    user_params = %{
      token: credentials.token,
      first_name: info.first_name,
      last_name: info.last_name,
      email: info.email,
      gravatar_url: Exgravatar.gravatar_url(info.email, s: 256),
      provider: Atom.to_string(auth.provider)
    }

    IO.inspect(gravatar_url(info.email,  s: 256))
    IO.inspect(user_params)

    {:ok, User.changeset(%User{}, user_params)}
  end

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%Users{}, ...]

  """
  def list_users do
    User
    |> Repo.all()
  end

  @doc """
  Gets a single users.

  Raises if the Users does not exist.

  ## Examples

      iex> get_users!(123)
      %Users{}

  """
  def get_users!(id) do
    id
    |> (&Repo.get!(User, &1)).()
  end

  @doc """
  Creates a users.

  ## Examples

      iex> create_users(%{field: value})
      {:ok, %Users{}}

      iex> create_users(%{field: bad_value})
      {:error, ...}

  """
  def create_users(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a users.

  ## Examples

      iex> update_users(users, %{field: new_value})
      {:ok, %Users{}}

      iex> update_users(users, %{field: bad_value})
      {:error, ...}

  """
  def update_users(%User{} = users, attrs) do
    users
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Users.

  ## Examples

      iex> delete_users(users)
      {:ok, %Users{}}

      iex> delete_users(users)
      {:error, ...}

  """
  def delete_users(%User{} = users) do
    Repo.delete(users)
  end

  @doc """
  Returns a data structure for tracking users changes.

  ## Examples

      iex> change_users(users)
      %Todo{...}

  """
  def change_users(%User{} = users) do
    User.changeset(users, %{})
  end
end
