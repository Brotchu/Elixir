defmodule Test do

  def factorial(num) do
    if num===1 do
      1
    else
      num*factorial(num-1)
    end
  end

end
