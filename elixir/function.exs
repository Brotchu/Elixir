defmodule Amazon do
  def total_price(base_price, delivery) do
    base_price + delivery.(base_price)
  end
  def prime_rate(base_price) do
    0
  end
  def normal_rate(base_price) do
    30
  end
  def fast_rate(base_price) do
    30 + base_price * 0.1
  end
end
