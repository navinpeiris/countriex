defmodule CountriexTest do
  use ExUnit.Case
  doctest Countriex

  describe "all/0" do
    test "returns all countries" do
      countries = Countriex.all

      assert countries |> length == 249
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
