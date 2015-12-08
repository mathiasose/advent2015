defmodule IntegerHelper do
  def reverse(n) do
    n |> Integer.to_string |> String.reverse |> String.to_integer
  end

  def is_palindrome?(n) do
    n == (reverse n)
  end
end
