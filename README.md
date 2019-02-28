# Countriex

[![Build Status](https://travis-ci.org/navinpeiris/countriex.svg?branch=master)](https://travis-ci.org/navinpeiris/countriex)
[![Hex version](https://img.shields.io/hexpm/v/countriex.svg "Hex version")](https://hex.pm/packages/countriex)
[![Hex downloads](https://img.shields.io/hexpm/dt/countriex.svg "Hex downloads")](https://hex.pm/packages/countriex)
[![Deps Status](https://beta.hexfaktor.org/badge/all/github/navinpeiris/countriex.svg)](https://beta.hexfaktor.org/github/navinpeiris/countriex)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)

A pure elixir port of the ruby [countries](https://github.com/hexorx/countries) gem that provides all sorts of useful information about every country packaged as convenient little country structs. It includes data from ISO 3166 (countries and states/subdivisions), ISO 4217 (currency), and E.164 (phone numbers).

## Installation

Add `countriex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:countriex, "~> 1.0.0"}]
end
```

## Usage

To get all country information:

```elixir
Countriex.all
```

To get all state information:

```elixir
Countriex.all_states
```

The `get_by/2` method can be used to retrieve the first matching country for any given criteria, for example:

```elixir
Countriex.get_by(:alpha2, "US")           # %Countriex.Country{name: "United States of America", alpha2: "US", alpha3: "USA", ...}
Countriex.get_by(:name, "United Kingdom") # %Countriex.Country{alpha2: "GB", alpha3: "GBR", ...}
```

The `filter/2` method can be used to retrieve all countries matching the given criteria:

```elixir
Countriex.get_by(:region, "Oceania") # [%Countriex.Country{name: "Kiribati", ...}, %Countriex.Country{name: "American Samoa", ...}, ...]
Countriex.get_by(:eu_member, true)   # [%Countriex.Country{name: "Luxembourg", ...}, %Countriex.Country{name: "Poland", ...}, ...]
```

The `all_states/2` method can be used to retrieve all states for the given country:

```elixir
country = Countriex.get_by(:alpha2, "US")
Countriex.all_states(country)
```

See the fields in the `Countriex.Country` and `Countriex.State` struct for all possible field names that can be used for the above methods.

## Development

### Regenerating country data

Run the following mix task to re-generate the country data.

```
mix countriex.generate_data
```

## License

The MIT License

Copyright (c) 2016-present Navin Peiris

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
