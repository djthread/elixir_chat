defmodule ElixirChatWeb.PageController do
  use ElixirChatWeb, :controller
  alias ElixirChat.Room

  def index(conn, _params) do
    render conn, "index.html", messages: Room.messages(20)
  end
end
