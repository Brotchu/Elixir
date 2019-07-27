defmodule Test do
  def check(code) do
    use Bitwise
    (code &&& 4)>0  
  end
end
