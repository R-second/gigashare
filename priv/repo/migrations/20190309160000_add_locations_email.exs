defmodule Gigashare.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    alter table(:locations) do
      add :email, :string
    end

  end
end

