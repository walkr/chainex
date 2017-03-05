defmodule Chainex.PageControllerTest do
  use Chainex.Web.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Chainex"
  end
end
