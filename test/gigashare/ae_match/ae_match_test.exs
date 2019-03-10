defmodule Gigashare.AEMatchTest do
  use Gigashare.DataCase

  alias Gigashare.AEMatch

  describe "locations" do
    alias Gigashare.AEMatch.Location

    @valid_attrs %{giga: 120.5, latitude: 120.5, locationName: "some locationName", longitude: 120.5, price: 42, time: 42}
    @update_attrs %{giga: 456.7, latitude: 456.7, locationName: "some updated locationName", longitude: 456.7, price: 43, time: 43}
    @invalid_attrs %{giga: nil, latitude: nil, locationName: nil, longitude: nil, price: nil, time: nil}

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AEMatch.create_location()

      location
    end

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert AEMatch.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert AEMatch.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      assert {:ok, %Location{} = location} = AEMatch.create_location(@valid_attrs)
      assert location.giga == 120.5
      assert location.latitude == 120.5
      assert location.locationName == "some locationName"
      assert location.longitude == 120.5
      assert location.price == 42
      assert location.time == 42
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AEMatch.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      assert {:ok, %Location{} = location} = AEMatch.update_location(location, @update_attrs)
      assert location.giga == 456.7
      assert location.latitude == 456.7
      assert location.locationName == "some updated locationName"
      assert location.longitude == 456.7
      assert location.price == 43
      assert location.time == 43
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = AEMatch.update_location(location, @invalid_attrs)
      assert location == AEMatch.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = AEMatch.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> AEMatch.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = AEMatch.change_location(location)
    end
  end
end
