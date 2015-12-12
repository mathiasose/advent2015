# Santa's previous password expired, and he needs help choosing a new one.
# To help him remember his new password after the old one expires,
# Santa has devised a method of coming up with a password based on the previous one.
# Corporate policy dictates that passwords must be exactly eight lowercase letters (for security reasons),
# so he finds his new password by incrementing his old password string repeatedly until it is valid.
# Incrementing is just like counting with numbers: xx, xy, xz, ya, yb, and so on.
# Increase the rightmost letter one step; if it was z, it wraps around to a, and repeat with the next letter to the left until one doesn't wrap around.
# Unfortunately for Santa, a new Security-Elf recently started, and he has imposed some additional password requirements:
#     Passwords must include one increasing straight of at least three letters, like abc, bcd, cde, and so on, up to xyz. They cannot skip letters; abd doesn't count.
#     Passwords may not contain the letters i, o, or l, as these letters can be mistaken for other characters and are therefore confusing.
#     Passwords must contain at least two different, non-overlapping pairs of letters, like aa, bb, or zz.
# Given Santa's current password (your puzzle input), what should his next password be?
# --- Part Two ---
# Santa's password expired again. What's the next one?

defmodule A11 do
  @alpha "abcdefghijklmnopqrstuvwxyz"
  @illegal ["i", "o", "l"]

  def incr_grapheme("z"), do: "a"
  def incr_grapheme(g) do
    p = @alpha
        |> String.codepoints
        |> Enum.find_index(fn(x) -> x == g end)

    @alpha
    |> String.at(p + 1)
  end

  def has_conseq_3?([_, _]), do: false
  def has_conseq_3?([a, b, c|_]) when c == (b + 1) and b == (a + 1), do: true
  def has_conseq_3?([_, b, c|t]), do: has_conseq_3?([b, c|t])
  def has_conseq_3?(s) do
    s
    |> String.to_char_list
    |> has_conseq_3?
  end

  def dubs([], acc), do: acc
  def dubs([_], acc), do: acc
  def dubs([a, b|t], acc) when a == b, do: dubs(t, acc ++ [a])
  def dubs([_, b|t], acc), do: dubs([b|t], acc)
  def dubs(s) do
    s
    |> String.codepoints
    |> dubs([])
  end

  def has_illegal_chars?(s) do
    s
    |> String.contains?(@illegal)
  end

  def valid_password?(s) do
    !has_illegal_chars?(s) and (dubs(s) |> Enum.uniq |> Enum.count) > 1 and has_conseq_3?(s)
  end

  def next_password(str) do
    h = String.slice(str, 0..-2)
    l = String.last(str)

    if l == "z" do
      next_password(h) <> "a"
    else
      h <> incr_grapheme(l)
    end
  end

  def next_valid_password(prev_password) do
    n = next_password(prev_password)

    if valid_password?(n) do
      n
    else
      next_valid_password(n)
    end
  end
end

"hepxcrrq"
|> A11.next_valid_password
|> A11.next_valid_password
|> IO.inspect
