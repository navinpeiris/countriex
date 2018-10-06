defmodule CountriexTest do
  use ExUnit.Case
  doctest Countriex

  describe "all/0" do
    test "returns all countries" do
      countries = Countriex.all

      assert countries |> length == 249
    end
  end

  describe "get_by/2" do
    test "returns the first country to match the given criteria" do
      country = Countriex.get_by(:name, "Jamaica")

      assert country.name == "Jamaica"
    end

    test "returns nil if no country matches the given criteria" do
      country = Countriex.get_by(:name, "United Kingdom")

      assert is_nil(country)
    end
  end

  describe "filter/2" do
    test "Returns all countries matching the given criteria" do
      countries = Countriex.filter(:currency_code, "USD")
      country = List.first(countries)

      assert length(countries) == 20
      assert country.name == "Antarctica"
      assert country.currency_code == "USD"
    end

    test "Returns an empty list if the criteria does not match any countries" do
      countries = Countriex.filter(:currency_code, "foo")

      assert countries == []
    end
  end

  describe "all_states/0" do
    test "returns all states" do
      states = Countriex.all_states

      assert states |> length == 4375
    end
  end

  describe "all_states/1" do
    test "returns all states of the US" do
      country = Countriex.get_by(:alpha2, "US")
      states = Countriex.all_states(country)

      assert states |> length == 60
    end
  end
end
