defmodule K09 do
  @chars ?A..?Z |> Enum.to_list
  @base Enum.count(@chars)

  def char_for_n(n) do
    (Enum.at @chars, n)
  end

  def do_the_thing(n, l \\ []) do
    if n == 0 do
      l
    else
      n = n - 1
      (do_the_thing (div n, @base), [(rem n, @base)] ++ l)
    end
  end

  def map_to_string(ns) do
    ns
    |> (Enum.map &char_for_n/1)
    |> to_string
  end
end

142453146368
|> K09.do_the_thing
|> K09.map_to_string
|> IO.inspect

