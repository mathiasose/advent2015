# Vi definerer et knalltall til å være et positivt heltall der primtallsfaktorene kun kan være 2, 3 eller 5.
# Unntaket er tallet 1 som også er definert til å være et knalltall,
# positive tall der primfaktorene kun inneholder 2, 3 eller 5.
# I tillegg er tallet 1 også regnet som det første knalltallet.
# Oppgaven går ut på å finne knalltall nummer 10000.

defmodule K13 do
  def sieve([h|t], done \\ []) do
    if Enum.count(done) >= 10_000 do
      done
    else
      sieve(t ++ [h * 2, h * 3, h * 5] |> Enum.sort |> Enum.dedup, done ++ [h])
    end
  end
end

K13.sieve([1])
|> Enum.fetch(10_000 - 1)
|> IO.inspect
