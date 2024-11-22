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
    field :name, :string
    field :email, :string
    field :street, :string
    field :city, :string
    field :country, :string
    field :zip, :string
    field :phone_no, :string

    timestamps()
  end

  def changeset(checkout_detail, params \\ %{}) do
    checkout_detail
    |> cast(params, @field)
  end
end
