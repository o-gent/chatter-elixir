defmodule ChatterWeb.PageController do
  use ChatterWeb, :controller
  require Logger

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def join(conn, params) do
    # fetch POST params
    room_id = Map.fetch!(params, "room_id")
    user = Map.fetch!(params, "user")

    # add them to the session
    put_session(conn, :user, user)
    put_session(conn, :room_id, room_id)

    # redirect to the room
    redirect(conn, to: "/room")
  end

  def room(conn, _params) do
    # the lobby id is encoded in the URL like /room/room_id
    #Map.fetch!(conn, "room_id")
    IO.inspect(conn)
    render(conn, "room.html")
  end

  def room_lobby(conn, _params) do
    # handle the room params
    user = conn.get_sesison(conn, :user)
    room_id = conn.get_session(conn, :room_id)

    # List the users currently in the room
    render(conn, "room.html")
  end

end
