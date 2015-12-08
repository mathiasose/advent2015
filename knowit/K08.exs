require PrimeFactors

# Vi definerer et primtall som et MIRPTALL dersom vi fortsatt har er primtall når sifrene reverseres.
# Regelen gjelder imidlertid ikke dersom tallet samtidig er et palindrom (dvs likt samme hvilken ende det leses fra, som 969).
# Hvor mange positive heltall under 1000 er MIRPTALL?

require IntegerHelper

defmodule K08 do
  def not_palindrome?(n), do: !(IntegerHelper.is_palindrome? n)
end


1..1000
|> Enum.filter(&PrimeFactors.is_prime?/1)
|> Enum.filter(&K08.not_palindrome?/1)
|> Enum.filter(fn(n) -> n |> IntegerHelper.reverse |> PrimeFactors.is_prime? end)
|> length
|> IO.inspect
