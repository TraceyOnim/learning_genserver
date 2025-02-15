defmodule CheckoutClient do
  def process(checkout_details) when is_list(checkout_details) do
    start_time = Time.utc_now()
    IO.puts("Starting time #{start_time}")

    Enum.each(checkout_details, fn checkout_detail ->
      process(checkout_detail)
    end)

    end_time = Time.utc_now()
    IO.puts("Ending time #{end_time}")
    IO.puts("Time taken #{Time.diff(end_time, start_time)}")
  end

  def process(checkout_detail) when is_map(checkout_detail) do
    CheckoutServer.start_link(checkout_detail)
  end
end
