# Finn summen av alle tall fra og med 1 og til og med 100 000 000 som er har 7 som en divisor,
# og samtidig IKKE har 5 som en divisor.

1..100_000_000
|> Enum.filter(fn(n) -> rem(n, 7) == 0 end)
|> Enum.filter(fn(n) -> rem(n, 5) != 0 end)
|> Enum.sum
|> IO.inspect
