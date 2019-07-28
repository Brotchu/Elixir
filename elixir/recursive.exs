defmodule Test do

  def factorial(num) do
    if num===0 do
      1
    else
      num*factorial(num-1)
    end
  end

end
