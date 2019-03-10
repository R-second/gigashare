defmodule Gigashare.Repo do
  use Ecto.Repo,
    otp_app: :gigashare,
    adapter: Ecto.Adapters.Postgres
end
