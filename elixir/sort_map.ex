defmodule Sort_map do


  def sort(list_map) do
    list_map
    |> Enum.sort_by( fn({x,y}) -> x end)  
  end


end
