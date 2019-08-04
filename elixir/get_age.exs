defmodule Age do
  def get_section() do
    {age,_} = IO.gets("your age : ") |> Integer.parse
    section = cond do
      age>18 -> "adult"
      age>60 -> "senior"
    end
  IO.puts "#{section}"

  end


end
