defmodule Check_cond do
  def check_even(num) do
    {rem(num,2),num}
  end
  def is_even(num) do
    val=check_even(num)
    case val do
      {0,_} -> "even"
      {1,_} -> "odd"
      _-> "something wrong"
    end
  end
end
