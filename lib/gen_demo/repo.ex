defmodule GenDemo.Repo do
  use Ecto.Repo,
    otp_app: :gen_demo,
    adapter: Ecto.Adapters.Postgres
end
