defmodule Countriex do
  @moduledoc """
  Provides all sorts useful information for every country in the ISO 3166 standard, and helper methods to filter/retrieve that information by.
  """

  @doc """
  Returns all country data
  """
  def all, do: Countriex.Data.countries

  @doc """
  Returns the first matching country with the given criteria, or `nil` if a country with that data does not exist.

  ## Examples

      iex> c = Countriex.get_by(:alpha2, "US")
      iex> c.name
      "United States"

      iex> Countriex.get_by(:alpha2, "XX")
      nil

      iex> Countriex.get_by(:foo, "XX")
      nil
  """
  def get_by(field, value), do: all |> Enum.find(fn country -> matches?(country, field, value) end)

  @doc """
  Returns all countries matching the given criteria, or `[]` if the criteria does not match any countries

  ## Examples

      iex> c = Countriex.filter(:region, "Americas")
      iex> c |> List.first |> Map.get(:name)
      "Uruguay"
      iex> c |> length
      57

      iex> Countriex.filter(:region, "foo")
      []
  """
  def filter(field, value), do: all |> Enum.filter(fn country -> matches?(country, field, value) end)

  defp matches?(country, field, value), do: Map.get(country, field) == value
end
