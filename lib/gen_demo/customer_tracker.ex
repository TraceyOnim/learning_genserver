defmodule CustomerTrackerServer do
  use GenServer

  # Client API

  def start_link(default \\ %{customers: 0, time: Time.utc_now()}) do
    GenServer.start_link(__MODULE__, default)
  end

  def add_or_remove_customer(pid, request) do
    GenServer.cast(pid, request)
  end

  def get_customer_no(pid, request) do
    GenServer.call(pid, request)
  end

  # Server API

  def init(state) do
    {:ok, state}
  end

  def handle_cast({:add_customers, no_of_customers}, state) do
    # raise "intentional error"
    {:noreply, %{state | customers: state.customers + no_of_customers, time: Time.utc_now()}}
  end

  def handle_cast({:remove_customers, no_of_customers}, state) do
    {:noreply, %{state | customers: state.customers - no_of_customers, time: Time.utc_now()}}
  end

  def handle_call(:get_customer_no, _from, state) do
    {:reply, "current customers number is #{state.customers}, time: #{state.time}", state}
  end
end

## Plan
# 1. Initial state: %{customer: 0, time: "7:00AM"}
# 2. Receiving customers at 8:00AM: %{customer: 2, time: "8:00AM"}
# 3. Supervisor inquiry: "current cusstomers: 2"
