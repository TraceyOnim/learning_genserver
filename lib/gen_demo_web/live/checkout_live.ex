defmodule GenDemoWeb.CheckoutLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <!-- component -->
    <div class="leading-loose grid place-content-center">
      <form class="max-w-xl m-4 p-10 bg-white rounded shadow-xl">
        <p class="text-gray-800 font-medium">Customer information</p>
        <div class="">
          <label class="block text-sm text-gray-00" for="cus_name">Name</label>
          <input
            class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded"
            id="cus_name"
            name="cus_name"
            type="text"
            required=""
            placeholder="Your Name"
            aria-label="Name"
          />
        </div>
        <div class="mt-2">
          <label class="block text-sm text-gray-600" for="cus_email">Email</label>
          <input
            class="w-full px-5  py-4 text-gray-700 bg-gray-200 rounded"
            id="cus_email"
            name="cus_email"
            type="text"
            required=""
            placeholder="Your Email"
            aria-label="Email"
          />
        </div>
        <div class="mt-2">
          <label class=" block text-sm text-gray-600" for="cus_email">Address</label>
          <input
            class="w-full px-2 py-2 text-gray-700 bg-gray-200 rounded"
            id="cus_email"
            name="cus_email"
            type="text"
            required=""
            placeholder="Street"
            aria-label="Email"
          />
        </div>
        <div class="mt-2">
          <label class="hidden text-sm block text-gray-600" for="cus_email">City</label>
          <input
            class="w-full px-2 py-2 text-gray-700 bg-gray-200 rounded"
            id="cus_email"
            name="cus_email"
            type="text"
            required=""
            placeholder="City"
            aria-label="Email"
          />
        </div>
        <div class="inline-block mt-2 w-1/2 pr-1">
          <label class="hidden block text-sm text-gray-600" for="cus_email">Country</label>
          <input
            class="w-full px-2 py-2 text-gray-700 bg-gray-200 rounded"
            id="cus_email"
            name="cus_email"
            type="text"
            required=""
            placeholder="Country"
            aria-label="Email"
          />
        </div>
        <div class="inline-block mt-2 -mx-1 pl-1 w-1/2">
          <label class="hidden block text-sm text-gray-600" for="cus_email">Zip</label>
          <input
            class="w-full px-2 py-2 text-gray-700 bg-gray-200 rounded"
            id="cus_email"
            name="cus_email"
            type="text"
            required=""
            placeholder="Zip"
            aria-label="Email"
          />
        </div>
        <p class="mt-4 text-gray-800 font-medium">Payment information</p>
        <div class="">
          <label class="block text-sm text-gray-600" for="cus_name">Phone Number</label>
          <input
            class="w-full px-2 py-2 text-gray-700 bg-gray-200 rounded"
            id="cus_name"
            name="cus_name"
            type="text"
            required=""
            placeholder="+254"
            aria-label="Name"
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
      </form>
    </div>
    """
  end

  def mount(params, session, socket) do
    {:ok, socket}
  end

  def handle_event("pay", _params, socket) do
    {:noreply, socket}
  end
end
