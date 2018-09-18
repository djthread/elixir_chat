defmodule ElixirChat.Room.Message do
  @moduledoc """
  Represents a message in the chatroom
  """

  defstruct [:stamp, :name, :body]
end
