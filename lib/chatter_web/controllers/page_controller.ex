defmodule ChatterWeb.PageController do
  use ChatterWeb, :controller

  def index(conn, params) do
    user = params[:user]
    render(conn, "index.html", user: user)
  end
end
