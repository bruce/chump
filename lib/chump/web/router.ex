defmodule Chump.Web.Router do
  use Chump.Web, :router

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

  forward "/api", Absinthe.Plug, schema: Chump.Web.Schema
  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: Chump.Web.Schema

end
