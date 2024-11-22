defmodule GenDemo.Customer.Accounts do
  alias GenDemo.Customer.CheckoutDetail
  alias GenDemo.Repo

  def change_checkout_detail(checkout_detail, params) do
    CheckoutDetail.changeset(checkout_detail, params)
  end

  def create_checkout_detail(params) do
    %CheckoutDetail{}
    |> change_checkout_detail(params)
    |> Repo.insert()
  end
end
