defmodule SibtWeb.Router do
  use SibtWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SibtWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/auth", SibtWeb do
    pipe_through :browser

    get "/:provider", SessionController, :request
    get "/:provider/callback", SessionController, :create
  end


  # Other scopes may use custom stacks.
  # scope "/api", SibtWeb do
  #   pipe_through :api
  # end
end
