defmodule ElixirChatWeb.RoomChannel do
  @moduledoc "Chatroom Phoenix channel!"

  use Phoenix.Channel
  alias ElixirChat.Room

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def join(_room, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", %{"name" => name, "body" => body}, socket) do
    message = Room.say(name, body)

    broadcast!(socket, "new_msg", message)

    {:noreply, socket}
  end
end
