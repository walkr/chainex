defmodule Chainex.Web.HelpController do
  use Chainex.Web, :controller

  def index(conn, _params) do
    render conn, "help.html"
  end
end
