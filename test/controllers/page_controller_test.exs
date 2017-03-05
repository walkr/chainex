defmodule Chainex.PageControllerTest do
  use Chainex.Web.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Chainex"
  end

  test "GET /explorer", %{conn: conn} do
    conn = get conn, "/explorer"
    assert html_response(conn, 200) =~ "Chainex"
  end

  test "GET /help", %{conn: conn} do
    conn = get conn, "/help"
    assert html_response(conn, 200) =~ "Chainex"
  end

end
