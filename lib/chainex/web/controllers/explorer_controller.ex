defmodule Chainex.Web.ExplorerController do
  use Chainex.Web, :controller

  def index(conn, _params) do
    render conn, "explorer.html"
  end
end
