defmodule Renter.Router do
  use Renter.Web, :router

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

  scope "/", Renter do
    pipe_through :browser # Use the default browser stack

    get "/", DashboardController, :show
    get "/signup", UserController, :new
    resources "/users", UserController, only: [:create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Renter do
  #   pipe_through :api
  # end
end
