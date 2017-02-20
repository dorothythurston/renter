defmodule Renter.Router do
  use Renter.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers

    if Mix.env == :test do
      plug Renter.Plug.SessionBackdoor
    end
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :require_authentication do
    plug Renter.Plug.Authenticate
  end

  scope "/", Renter do
    pipe_through :browser # Use the default browser stack

    get "/sign_up", UserController, :new, as: :sign_up
    resources "/users", UserController, only: [:create]
    get "/sign_in", SessionController, :new, as: :sign_in
    resources "/sessions", SessionController, only: [:create]
  end

  scope "/", Renter do
    pipe_through [:browser, :require_authentication]

    get "/", DashboardController, :show
  end
  # Other scopes may use custom stacks.
  # scope "/api", Renter do
  #   pipe_through :api
  # end
end
