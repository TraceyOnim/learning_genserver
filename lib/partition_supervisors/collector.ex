defmodule PartitionSupervisors.Collector do
  @doc """
  Collects message given and prints for easy illustration.
  Shows how partition are started and how messages are routed to them.
  To run multiple of these, we can start them under a PartitionSupervisor by placing this in our supervision tree

  {PartitionSupervisor,
  child_spec: Collector.child_spec([some: :arg]),
  name: MyApp.PartitionSupervisor
  }

  We can send messages to them using a "via tuple":

  # The key is used to route our message to a particular instance.
  key = 1
  Collector.collect({:via, PartitionSupervisor, {MyApp.PartitionSupervisor, key}}, :hi)
  # ["current messages:", [:hi], " in process", #PID<0.602.0>]
  :ok
  Collector.collect({:via, PartitionSupervisor, {MyApp.PartitionSupervisor, key}}, :ho)
  # ["current messages:", [:ho, :hi], " in process", #PID<0.602.0>]
  :ok

  # With a different key, the message will be routed to a different instance.
  key = 2
  Collector.collect({:via, PartitionSupervisor, {MyApp.PartitionSupervisor, key}}, :a)
  # ["current messages:", [:a], " in process", #PID<0.603.0>]
  :ok
  Collector.collect({:via, PartitionSupervisor, {MyApp.PartitionSupervisor, key}}, :b)
  # ["current messages:", [:b, :a], " in process", #PID<0.603.0>]
  :ok
  """

  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args)
  end

  def init(args) do
    IO.inspect([__MODULE__, " got args ", args, " in ", self()])
    {:ok, []}
  end

  def collect(server, message) do
    GenServer.call(server, {:collect, message})
  end

  def handle_call({:collect, message}, _from, state) do
    new_state = [message | state]

    IO.inspect(["current_message:", new_state, " in process", self()])
    {:reply, :ok, new_state}
  end
end
