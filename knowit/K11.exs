require FileHelper
require RomanNumerals
require EnumHelper

defmodule K11 do
  def binary?(s), do: String.starts_with?(s, "0b")

  def get_value(x) do
    cond do
      binary?(x) ->
        x
        |> String.replace("0b", "0")
        |> String.to_integer(2)
      RomanNumerals.is_roman_numeral?(x) ->
        x
        |> RomanNumerals.to_decimal
      true ->
        x
        |> String.to_integer
    end
  end
end

(FileHelper.read_lines "knowit/input/11.txt")
|> FileHelper.strip_empty_lines
|> Enum.map(&String.strip/1)
|> Enum.sort_by(&K11.get_value/1)
|> EnumHelper.median
|> IO.inspect
