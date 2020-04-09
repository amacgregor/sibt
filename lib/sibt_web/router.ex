defmodule SibtWeb.Router do
  use SibtWeb, :router
  use Plug.ErrorHandler
  use Sentry.Plug

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug SibtWeb.Plugs.SetUser
    plug SibtWeb.Plugs.SetViewRegistry
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SibtWeb do
    pipe_through :browser

    resources "/projects", ProjectController, except: [:show]
    get "/", PageController, :index
    get "/project/:project_code", ProjectController, :show
  end

  scope "/user/", SibtWeb do
    pipe_through :browser

    resources "/projects", UserProjectController, except: [:show]
  end

  scope "/auth", SibtWeb do
    pipe_through :browser

    get "/signout", SessionController, :delete
    get "/:provider", SessionController, :request
    get "/:provider/callback", SessionController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", SibtWeb do
  #   pipe_through :api
  # end
end
