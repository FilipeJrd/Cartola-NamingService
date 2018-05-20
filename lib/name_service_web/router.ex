defmodule NameServiceWeb.Router do
  use NameServiceWeb, :router

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

  scope "/", NameServiceWeb do
    pipe_through :api # Use the default browser stack

    post "/register", PageController, :register
    get "/lookup", PageController, :lookup
  end

  # Other scopes may use custom stacks.
  # scope "/api", NameServiceWeb do
  #   pipe_through :api
  # end
end
