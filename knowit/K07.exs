require PrimeFactors

# Finn summen av alle positive heltall mellom 0 og 1000 som er har 7 som en primtallsfaktor,
# der det reverserte tallet også har 7 som en primtallsfaktor.

defmodule K07 do
  def reverse(n) do
    n |> Integer.to_string |> String.reverse |> String.to_integer
  end

  def seven?(n) do
    n == 7 || (Enum.member? (PrimeFactors.of n), 7)
  end
end


1..1000
|> Enum.filter(&K07.seven?/1)
|> Enum.filter(fn(n) -> n |> K07.reverse |> K07.seven? end)
|> Enum.sum
|> IO.inspect
