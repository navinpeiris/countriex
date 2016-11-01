defmodule Countriex.Country do
  defstruct [:address_format, :continent, :alpha2, :alpha3, :country_code, :international_prefix, :ioc, :gec, :name, :national_destination_code_lengths, :national_number_lengths,
             :national_prefix, :number, :region, :subregion, :world_region, :un_locode, :nationality, :postal_code, :unofficial_names, :languages_official, :languages_spoken, :geo,
             :currency_code, :alt_currency, :eea_member, :eu_member, :vat_rates]
end
