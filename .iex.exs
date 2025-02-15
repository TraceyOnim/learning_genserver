checkout_details =
Enum.map(["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"], fn x ->
  %{
    "id" => String.to_atom(x),
    "city" => "somewhere",
    "country" => "somewhere",
    "email" => "tee@email.com",
    "name" => "Tee",
    "phone_no" => "111",
    "street" => "somewhere",
    "zip" => "somewhere000",
    "items" => %{"item_1" => "900", "item_2" => "300", "total" => "#{x}"}
  }
end)
