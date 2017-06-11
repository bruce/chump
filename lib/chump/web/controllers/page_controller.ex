defmodule Chump.Web.PageController do
  use Chump.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
