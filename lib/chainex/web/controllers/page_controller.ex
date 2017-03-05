defmodule Chainex.Web.PageController do
  use Chainex.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
