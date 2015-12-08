# The elves are running low on wrapping paper, and so they need to submit an order for more.
# They have a list of the dimensions (length l, width w, and height h) of each present, and only want to order exactly as much as they need.
# Fortunately, every present is a box (a perfect right rectangular prism),
# which makes calculating the required wrapping paper for each gift a little easier:
# find the surface area of the box, which is 2*l*w + 2*w*h + 2*h*l.
# The elves also need a little extra paper for each present: the area of the smallest side.
# All numbers in the elves' list are in feet. How many total square feet of wrapping paper should they order?
# --- Part Two ---
# The elves are also running low on ribbon. Ribbon is all the same width,
# so they only have to worry about the length they need to order, which they would again like to be exact.
# The ribbon required to wrap a present is the shortest distance around its sides, or the smallest perimeter of any one face.
# Each present also requires a bow made out of ribbon as well;
# the feet of ribbon required for the perfect bow is equal to the cubic feet of volume of the present.
# Don't ask how they tie the bow, though; they'll never tell.
# How many total feet of ribbon should they order?

require FileHelper

defmodule A02 do
  def parse_line(line) do
    line |> (String.split "x") |> (Enum.map &String.to_integer/1)
  end

  def box_area([l, w, h]) do
    2 * (l * w + l * h + w * h) + (Enum.min [l * w, l * h, w * h])
  end

  def ribbon_length([l, w, h]) do
    2 * (Enum.reduce (Enum.take (Enum.sort [l, w, h]), 2), &(&1 + &2)) + l * w * h
  end
end

(FileHelper.read_lines "advent/input/I02.txt")
|> FileHelper.strip_empty_lines
|> (Enum.map &A02.parse_line/1)
|> (Enum.map &A02.box_area/1)
|> Enum.sum
|> IO.inspect

(FileHelper.read_lines "advent/input/I02.txt")
|> FileHelper.strip_empty_lines
|> (Enum.map &A02.parse_line/1)
|> (Enum.map &A02.ribbon_length/1)
|> Enum.sum
|> IO.inspect
