defmodule Countriex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :countriex,
      version: "0.4.1",
      name: "Countriex",
      description: "All sorts of useful information about every country. A pure elixir port of the ruby Countries gem",
      elixir: "~> 1.15",
      source_url: "https://github.com/navinpeiris/countriex",
      homepage_url: "https://github.com/navinpeiris/countriex",
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      docs: [extras: ["README.md"]]
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp package do
    [files: ["lib", "mix.exs", "README*", "LICENSE*"],
     maintainers: ["Navin Peiris"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/navinpeiris/countriex"}]
  end

  defp elixirc_paths(:dev), do: ["lib", "tasks"]
  defp elixirc_paths(_),    do: ["lib"]

  defp deps do
    [
      {:earmark, "~> 1.4", only: :dev},
      {:ex_doc, "~> 0.34", only: :dev},
      {:req, "~> 0.5", only: :dev},
      {:jason, "~> 1.4", only: :dev}
    ]
  end
end
