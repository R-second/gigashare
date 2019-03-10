defmodule Gigashare.AEMatch.Location do
  use Ecto.Schema
  import Ecto.Changeset


  schema "locations" do
    field :giga, :float
    field :latitude, :float
    field :locationName, :string
    field :longitude, :float
    field :price, :integer
    field :time, :integer
    field :email, :string
    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:latitude, :longitude, :locationName, :giga, :time, :price, :email])
    |> validate_required([:latitude, :longitude, :locationName, :giga, :time, :price, :email])
  end
end
