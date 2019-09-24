defmodule Letter_freq.Count do

#send(pid,{self(), {char, str }})

  def count_process() do
    receive do
      {controller_id,{char, str}} -> send(controller_id,{:ok,counter(char,str)})
      _ -> "Error at count_process"
      end
  end

  def counter(char, str) do
    str
    |> String.graphemes
    |> Enum.filter( fn(x) -> char==x end )
    |> Enum.count
  end

end
