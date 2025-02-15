defmodule GenDemo.Customer.CheckoutDetail do
  use Ecto.Schema
  import Ecto.Changeset

  @field [
    :name,
    :email,
    :street,
    :city,
    :country,
    :zip,
    :phone_no
  ]

  schema "customer_checkout_details" do
    field :name, :string, default: "Tee"
    field :email, :string, default: "tee@email.com"
    field :street, :string, default: "somewhere"
    field :city, :string, default: "somewhere"
    field :country, :string, default: "somewhere"
    field :zip, :string, default: "somewhere000"
    field :phone_no, :string, default: "999"

    timestamps()
  end

  def changeset(checkout_detail, params \\ %{}) do
    checkout_detail
    |> cast(params, @field)
  end
end
