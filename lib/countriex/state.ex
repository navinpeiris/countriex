defmodule Countriex.State do
  defstruct [:name,
             :unofficial_names,
             :country_alpha3,
             :code,
             :translations,
             :geo]
end
