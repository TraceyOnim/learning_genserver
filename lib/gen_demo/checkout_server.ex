defmodule CheckoutServer do
  use GenServer

  # client

  def start_link(arg \\ %{}) do
    GenServer.start_link(__MODULE__, arg, name: arg["id"])
  end

  # server
  def init(state) do
    {:ok, state, {:continue, :process_checkout}}
  end

  def handle_continue(:process_checkout, state) do
    with {:ok, "saved"} <- save_checkout_details(state),
         {:ok, "payment_successful"} <-
           make_payment(state["items"]["total"], state["phone_no"]) do
      :ok
    else
      error -> error
    end

    {:stop, :normal, state}
  end

  defp save_checkout_details(_params) do
    Process.sleep(10000)
    IO.puts("checkout details saved successfully")
    {:ok, "saved"}
  end

  defp make_payment(amount, phone_no) do
    Process.sleep(50000)

    IO.puts(
      "payment of amount #{amount} from the phone_number #{phone_no} has been processed successfully"
    )

    {:ok, "payment_successful"}
  end
end
