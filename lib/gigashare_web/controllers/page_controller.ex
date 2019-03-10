defmodule GigashareWeb.PageController do
  use GigashareWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
