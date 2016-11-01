defmodule CountriexTest do
  use ExUnit.Case
  doctest Countriex

  describe "all/0" do
    test "returns all countries" do
      countries = Countriex.all

      assert countries |> length == 249
    end
  end
end
