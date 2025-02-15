defmodule GenDemoWeb.CheckoutLive do
  use Phoenix.LiveView
  import GenDemoWeb.CoreComponents
  alias GenDemo.Customer.Accounts
  alias GenDemo.Customer.CheckoutDetail

  def render(assigns) do
    ~H"""
    <!-- component -->
    <div class="leading-loose grid place-content-center">
    <p><%= @request_received_at %></p>
    <p><%= if @time_completed, do: "Time of checkout completion" %><%= @time_completed %></p>
    <p><%= @checkout_message %></p>
      <.form
        class="max-w-xl m-4 p-10 bg-white rounded shadow-xl"
        for={@form}
        phx-change="validate"
        phx-submit="pay"
      >
        <p class="text-gray-800 font-medium">Customer information</p>
        <div class="">
          <label class="block text-sm text-gray-00" for="cus_name">Name</label>
          <.input
            class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded"
            id="name"
            name="name"
            type="text"
            required=""
            placeholder="Your Name"
            aria-label="Name"
            field={@form[:name]}
          />
        </div>
        <div class="mt-2">
          <label class="block text-sm text-gray-600" for="cus_email">Email</label>
          <.input
            class="w-full px-5  py-4 text-gray-700 bg-gray-200 rounded"
            id="email"
            name="email"
            type="text"
            required=""
            placeholder="Your Email"
            aria-label="Email"
            field={@form[:email]}
          />
        </div>
        <div class="mt-2">
          <label class=" block text-sm text-gray-600" for="cus_email">Address</label>
          <.input
            class="w-full px-2 py-2 text-gray-700 bg-gray-200 rounded"
            id="street"
            name="street"
            type="text"
            required=""
            placeholder="Street"
            aria-label="Street"
            field={@form[:street]}
          />
        </div>
        <div class="mt-2">
          <label class="hidden text-sm block text-gray-600" for="cus_email">City</label>
          <.input
            class="w-full px-2 py-2 text-gray-700 bg-gray-200 rounded"
            id="city"
            name="city"
            type="text"
            required=""
            placeholder="City"
            aria-label="City"
            field={@form[:city]}
          />
        </div>
        <div class="inline-block mt-2 w-1/2 pr-1">
          <label class="hidden block text-sm text-gray-600" for="cus_email">Country</label>
          <.input
            class="w-full px-2 py-2 text-gray-700 bg-gray-200 rounded"
            id="country"
            name="country"
            type="text"
            required=""
            placeholder="Country"
            aria-label="Country"
            field={@form[:country]}
          />
        </div>
        <div class="inline-block mt-2 -mx-1 pl-1 w-1/2">
          <label class="hidden block text-sm text-gray-600" for="cus_email">Zip</label>
          <.input
            class="w-full px-2 py-2 text-gray-700 bg-gray-200 rounded"
            id="zip"
            name="zip"
            type="text"
            required=""
            placeholder="Zip"
            aria-label="Zip"
            field={@form[:zip]}
          />
        </div>
        <p class="mt-4 text-gray-800 font-medium">Payment information</p>
        <div class="">
          <label class="block text-sm text-gray-600" for="cus_name">Phone Number</label>
          <.input
            class="w-full px-2 py-2 text-gray-700 bg-gray-200 rounded"
            id="phone_no"
            name="phone_no"
            type="text"
            required=""
            placeholder="+254"
            aria-label="Phone_no"
            field={@form[:phone_no]}
          />
        </div>
        <div class="px-4 pt-8">
          <p class="text-xl font-medium">Order Summary</p>
          <p class="text-gray-400">Check your items. And select a suitable shipping method.</p>
        </div>
        <div class="mt-8 space-y-3 rounded-lg border bg-white px-2 py-4 sm:px-6">
          <div class="flex flex-col rounded-lg bg-white sm:flex-row">
            <img
              class="m-2 h-24 w-28 rounded-md border object-cover object-center"
              src="https://images.unsplash.com/flagged/photo-1556637640-2c80d3201be8?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c25lYWtlcnxlbnwwfHwwfHw%3D&amp;auto=format&amp;fit=crop&amp;w=500&amp;q=60"
              alt=""
            />
            <div class="flex w-full flex-col px-4 py-4">
              <span class="font-semibold">Nike Air Max Pro 8888 - Super Light</span>
              <span class="float-right text-gray-400">42EU - 8.5US</span>
              <p class="text-lg font-bold">KES 4000.00</p>
            </div>
          </div>
          <div class="flex flex-col rounded-lg bg-white sm:flex-row">
            <img
              class="m-2 h-24 w-28 rounded-md border object-cover object-center"
              src="https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8c25lYWtlcnxlbnwwfHwwfHw%3D&amp;auto=format&amp;fit=crop&amp;w=500&amp;q=60"
              alt=""
            />
            <div class="flex w-full flex-col px-4 py-4">
              <span class="font-semibold">Nike Air Max Pro 8888 - Super Light</span>
              <span class="float-right text-gray-400">42EU - 8.5US</span>
              <p class="mt-auto text-lg font-bold">KES 5000.00</p>
            </div>
          </div>
        </div>
        <div class="mt-6 flex items-center justify-between">
          <p class="text-sm font-medium text-gray-900">Total</p>
          <p class="text-2xl font-semibold text-gray-900">KES9000.00</p>
        </div>
        <button class="mt-4 mb-8 w-full rounded-md bg-gray-900 px-6 py-3 font-medium text-white">
          Place Order
        </button>
      </.form>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok,
     socket |> assign(request_received_at: nil, time_completed: nil, checkout_message: nil, form: to_form(Accounts.change_checkout_detail(%CheckoutDetail{}, %{})))}
  end

  def handle_event("validate", params, socket) do
    form =
      %CheckoutDetail{}
      |> Accounts.change_checkout_detail(params)
      |> to_form(action: :validate)
      |> IO.inspect()

    {:noreply, assign(socket, form: form)}
  end

  def handle_event("pay", params, socket) do
    request_received_at = DateTime.utc_now()
    IO.inspect(params, label: "==============params")

    case Accounts.create_checkout_detail(params) do
      {:ok, _details} ->
        {:noreply,
         assign(socket, checkout_message: "payment_successfull", time_completed: DateTime.utc_now(), request_received_at: request_received_at)
         }

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
