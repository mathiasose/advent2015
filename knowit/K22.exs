s = "evdhtiqgfyvcytohqppcmdbultbnzevdbakvkcdpbatbtjlmzaolfqfqjifkoanqcznmbqbeswglgrzfroswgxoritbw"
{first, second} = s
                  |> String.to_char_list
                  |> Enum.split(div(s |> String.length, 2))

Enum.zip(first, second |> Enum.reverse)
|> Enum.map(fn({a, b}) -> abs(a - b) end)
|> Enum.sum
|> IO.inspect
