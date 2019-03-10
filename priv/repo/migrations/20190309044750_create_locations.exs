defmodule Gigashare.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :latitude, :float
      add :longitude, :float
      add :locationName, :string
      add :giga, :float
      add :time, :integer
      add :price, :integer
      add :email, :string

      timestamps()
    end

  end
end
