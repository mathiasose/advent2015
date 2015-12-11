# Inspired by http://rosettacode.org/wiki/Roman_numerals/Decode#Elixir
defmodule RomanNumerals do
  @moduledoc false

  @symbols %{"I" => 1,
             "V" => 5,
             "X" => 10,
             "L" => 50,
             "C" => 100,
             "D" => 500,
             "M" => 1000
             }
  def symbols, do: @symbols

  def is_roman_numeral?(str) do
    @symbols
    |> Map.keys
    |> Enum.any?(fn(symbol) -> String.contains?(str, symbol) end)
  end

  def to_decimal(n) do
    n
    |> String.codepoints
    |> decode
  end

  def symbol_value(s), do: Map.get(@symbols, s)

  defp decode([]), do: 0

  defp decode([x]), do: symbol_value(x)

  defp decode([h1, h2|rest]) do
    case {symbol_value(h1), symbol_value(h2)} do
      {v1, v2} when (v1 < v2) -> v2 - v1 + decode(rest)
      {v1, v1} -> v1 + v1 + decode(rest)
      {v1, _} -> v1 + decode([h2|rest])
    end
  end
end
