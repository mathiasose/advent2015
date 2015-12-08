defmodule FileHelper do
  def read_lines(path) do
    (File.read! path)
    |> (String.split "\n")
  end

  def strip_empty_lines([h|t]) do
    [h|t]
    |> (Enum.filter &((String.rstrip &1) != ""))
  end
end
