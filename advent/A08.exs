# Space on the sleigh is limited this year, and so Santa will be bringing his list as a digital copy.
# He needs to know how much space it will take up when stored.
# It is common in many programming languages to provide a way to escape special characters in strings.
# For example, C, JavaScript, Perl, Python, and even PHP handle special characters in very similar ways.
# However, it is important to realize the difference between the number of characters in the code representation of the string literal
# and the number of characters in the in-memory string itself.
# Santa's list is a file that contains many double-quoted string literals, one on each line.
# The only escape sequences used are \\ (which represents a single backslash), \" (which represents a lone double-quote character),
# and \x plus two hexadecimal characters (which represents a single character with that ASCII code).
# Disregarding the whitespace in the file,
# what is the number of characters of code for string literals
# minus the number of characters in memory for the values of the strings in total for the entire file?
# --- Part Two ---
# Now, let's go the other way.
# In addition to finding the number of characters of code,
# you should now encode each code representation as a new string and find the number of characters of the new encoded representation,
# including the surrounding double quotes.
# Your task is to find the total number of characters to represent the newly encoded strings minus the number of characters of code in each original string literal.
# For example, for the strings above, the total encoded length (6 + 9 + 16 + 11 = 42)
# minus the characters in the original code representation (23, just like in the first part of this puzzle) is 42 - 23 = 19.

require FileHelper

defmodule A08 do
  def string_char_count(line) do
    line
    |> String.length
  end

  def mem_char_count(line) do
    if (String.starts_with? line, "\"") && (String.starts_with? line, "\"") do
      (mem_char_count (String.slice line, 1..-2))
    else
      line
      |> (String.replace ~r/\\\"/, "1")
      |> (String.replace ~r/\\\\/, "1")
      |> (String.replace ~r/\\x[0-9a-f]{2}/, "1")
      |> String.length
    end
  end

  def matchsticks_number(line) do
    (string_char_count line) - (mem_char_count line)
  end

  def codepoint_weight(codepoint) do
    case codepoint do
      "\"" -> 2
      "\\" -> 2
      _    -> 1
    end
  end

  def line_weigth(line) do
    line
    |> String.codepoints
    |> (Enum.map &codepoint_weight/1)
    |> Enum.sum
  end

  def matchsticks_number_2(line) do
    (line_weigth line) + 2 - (string_char_count line)
  end
end

(FileHelper.read_lines "advent/input/I08.txt")
|> FileHelper.strip_empty_lines
|> (Enum.map &A08.matchsticks_number/1)
|> Enum.sum
|> IO.inspect

(FileHelper.read_lines "advent/input/I08.txt")
|> FileHelper.strip_empty_lines
|> (Enum.map &A08.matchsticks_number_2/1)
|> Enum.sum
|> IO.inspect
