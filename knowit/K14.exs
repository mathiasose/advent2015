defmodule K14 do
  @rotations %{
    "0" => "0",
    "1" => "1",
    "6" => "9",
    "8" => "8",
    "9" => "6"
  }

  def rotate(str) do
    str
    |> String.codepoints
    |> Enum.map(fn(x) -> Dict.get(@rotations, x, "") end)
    |> Enum.reduce(fn(a, b) -> a <> b end)
  end

  def is_rotate_equal?(n) do
    str = n
          |> to_string

    str == rotate(str)
  end
end

0..100_000
|> Enum.filter(&K14.is_rotate_equal?/1)
|> Enum.count
|> IO.inspect
