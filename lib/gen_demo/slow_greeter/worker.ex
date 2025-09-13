defmodule GenDemo.SlowGreeter.Worker do
  use GenServer

  def start_link(%{name: name, from: from}) do
    GenServer.start_link(__MODULE__, %{name: name, from: from})
  end

  def init(state) do
    :timer.sleep(5000)
    # IO.puts("Initializing worker")
    send(self(), :greet)
    {:ok, state}
  end

  def handle_info(:greet, %{name: name, from: from} = state) do
    # :timer.sleep(5000)
    IO.puts("Hello, from #{from}, #{name}")
    {:noreply, state}
  end
end
