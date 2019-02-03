defmodule Sibt.TestHelpers do
  @moduledoc false
  alias Sibt.{Repo, User}

  def user_fixture(attrs \\ %{}) do
    params =
      attrs
      |> Enum.into(%{
        first_name: "Tony",
        last_name: "Stark",
        email: "tony#{System.unique_integer([:positive])}@thetiger.com",
        token: "asdf1234567890",
        provider: "facebook"
      })

    {:ok, user} =
      User.changeset(%User{}, params)
      |> Repo.insert()

    user
  end
end
