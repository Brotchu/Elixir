defmodule Letter_freq.Control do

@alphs "abcdefghijklmnopqrstuvwxyz"

def count_alpha(char, str) do
  pid = spawn(Letter_freq.Count, :count_process, [])
  send(pid,{self(), {char, str }})
  receive do
    {:ok,num} -> {:ok, char, num}
    _ -> "Error"
  end
end


  def count_letters(text) do
    @alphs
    |> String.graphemes
    |> Enum.map( fn(x) -> count_alpha(x,text) end )
  end



end
