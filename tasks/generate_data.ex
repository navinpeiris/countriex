defmodule Mix.Tasks.Countriex.GenerateData do
  alias Countriex.{Country, Geo}

  @countries_json_url "https://raw.githubusercontent.com/hexorx/countries/master/lib/countries/cache/countries.json"

  def run(_) do
    data_from_url()
    |> Map.values
    |> parse
    |> sort
    |> generate_file_content
    |> write_to_file
  end

  defp data_from_url do
    Application.ensure_all_started(:req)

    @countries_json_url
    |> Req.get!()
    |> Map.fetch!(:body)
    |> Jason.decode!(keys: :atoms)
  end

  defp parse(data) when is_list(data) do
    Enum.map(data, &parse/1)
  end

  defp parse(data) when is_map(data) do
    geo = data.geo |> parse_geo
    data = data |> rename_renamed_fields()
    %Country{} |> Map.merge(data) |> Map.merge(%{geo: geo})
  end

  # Upstream JSON renamed some fields over time. Map them back to the
  # struct field names this library publishes.
  defp rename_renamed_fields(data) do
    Enum.reduce(
      [{:iso_short_name, :name}],
      data,
      fn {from, to}, acc ->
        case Map.pop(acc, from) do
          {nil, acc} -> acc
          {value, acc} -> Map.put_new(acc, to, value)
        end
      end
    )
  end

  defp parse_geo(geo_data) do
    %Geo{
      latitude:       geo_data |> Map.get(:latitude) |> to_float,
      longitude:      geo_data |> Map.get(:longitude) |> to_float,
      max_latitude:   geo_data |> Map.get(:max_latitude) |> to_float,
      max_longitude:  geo_data |> Map.get(:max_longitude) |> to_float,
      min_latitude:   geo_data |> Map.get(:min_latitude) |> to_float,
      min_longitude:  geo_data |> Map.get(:min_longitude) |> to_float,
    }
  end

  defp sort(countries), do: countries |> Enum.sort_by(&Map.get(&1, :alpha2))

  defp generate_file_content(data) do
    """
    defmodule Countriex.Data do
      @moduledoc \"\"\"
      This module is generated using json files in the ruby [countries](https://github.com/hexorx/countries) gem.

      To regenerate this file, run `mix countriex.generate_data`
      \"\"\"

      def countries do
    #{format(data)}
      end
    end
    """
  end

  defp write_to_file(content), do: File.write!("lib/countriex/data.ex", content)

  defp to_float(nil), do: nil
  defp to_float(val) when is_integer(val), do: val / 1.0
  defp to_float(val) when is_float(val), do: val
  defp to_float(str) do
    {result, _} = Float.parse(str)
    result
  end

  defp format(data) do
    data
    |> inspect(pretty: true, limit: :infinity, width: 0, charlists: :as_lists, custom_options: [sort_maps: true])
    |> String.split("\n")
    |> Enum.map(fn line -> "    " <> line end)
    |> Enum.join("\n")
  end
end
