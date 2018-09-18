defmodule ElixirChat.Room do
  @moduledoc """
  Manages the persistent chatroom state
  """

  defmodule Message do
    @moduledoc """
    Represents a message in the chatroom
    """

    defstruct [:name, :body]
  end

  use GenServer
  alias ElixirChat.Room.Message
  require Logger

  # Client

  def child_spec do
    %{start: {__MODULE__, :start_link, []}}
  end

  def start_link(initial_state) do
    GenServer.start_link(__MODULE__, initial_state, name: __MODULE__)
  end

  def say(name, body) do
    GenServer.call(__MODULE__, {:say, name, body})
  end

  def messages do
    GenServer.call(__MODULE__, :messages)
  end

  def messages(num) do
    GenServer.call(__MODULE__, {:messages, num})
  end

  # Server

  @impl true
  def init(initial_state) do
    Logger.debug("Room: init")
    {:ok, initial_state}
  end

  @impl true
  def handle_call({:say, name, body}, _from, state) do
    msg = %Message{name: name, body: body}
    {:reply, msg, [msg | state]}
  end

  @impl true
  def handle_call(:messages, _from, state) do
    {:reply, Enum.reverse(state), state}
  end

  @impl true
  def handle_call({:messages, num}, _from, state) when num > 0 do
    msgs = state |> Enum.slice(0, num) |> Enum.reverse()

    {:reply, msgs, state}
  end
end
