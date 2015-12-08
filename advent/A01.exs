# Santa is trying to deliver presents in a large apartment building,
# but he can't find the right floor - the directions he got are a little confusing.
# He starts on the ground floor (floor 0) and then follows the instructions one character at a time.
# An opening parenthesis, (, means he should go up one floor, and a closing parenthesis, ), means he should go down one floor.
# The apartment building is very tall, and the basement is very deep; he will never find the top or bottom floors.
# To what floor do the instructions take Santa?

# --- Part Two ---
# Now, given the same instructions, find the position of the first character that causes him to enter the basement (floor -1).
# The first character in the instructions has position 1, the second character has position 2, and so on.
# What is the position of the character that causes Santa to first enter the basement?

defmodule A01 do
  def paren_value("("), do: 1
  def paren_value(")"), do: -1

  def seek_basement([h|t], floor, position) do
    if floor + paren_value(h) == -1 do
      position + 1
    else
      seek_basement(t, floor + paren_value(h), position + 1)
    end
  end
  def seek_basement([h|t]), do: seek_basement([h|t], 0, 0)
end

(File.read! "advent/input/I01.txt")
|> String.codepoints
|> Enum.map(&A01.paren_value/1)
|> Enum.sum
|> IO.inspect

(File.read! "advent/input/I01.txt")
|> String.codepoints
|> A01.seek_basement
|> IO.inspect
