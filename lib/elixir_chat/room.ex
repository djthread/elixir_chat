defmodule ElixirChat.Room do
  @moduledoc """
  Manages the persistent chatroom state
  """

  use GenServer
  alias DateTime.Format
  alias ElixirChat.Room.Message

  # Client

  def child_spec do
    %{start: {__MODULE__, :start_link, []}}
  end

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def say(name, body) do
    GenServer.call(__MODULE__, {:say, name, body})
  end

  # Server

  @impl true
  def init do
    {:ok, []}
  end

  @impl true
  def handle_call({:say, name, body}, _from, state) do
    msg = %Message{
      name: name,
      body: body,
      stamp: Format.rfc3339()
    }

    {:reply, msg, [msg | state]}
  end
end
