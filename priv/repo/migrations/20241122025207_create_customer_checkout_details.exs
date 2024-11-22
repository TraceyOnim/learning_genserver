defmodule GenDemo.Repo.Migrations.CreateCustomerCheckoutDetails do
  use Ecto.Migration

  def change do
    create table("customer_checkout_details") do
      add :name, :string
      add :email, :string
      add :street, :string
      add :city, :string
      add :country, :string
      add :zip, :string
      add :phone_no, :string

      timestamps()
    end
  end
end
