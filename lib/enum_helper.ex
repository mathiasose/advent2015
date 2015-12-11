defmodule EnumHelper do
  @moduledoc false

  def median(sorted_list) do
    m = div(Enum.count(sorted_list), 2)
    r = rem(Enum.count(sorted_list), 2)

    if r == 1 do
      sorted_list
      |> Enum.at(m)
    else
      (Enum.at(sorted_list, m) + Enum.at(sorted_list, m + 1)) / 2
    end
  end
end
