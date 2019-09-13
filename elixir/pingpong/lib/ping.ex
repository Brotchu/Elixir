defmodule Pingpong.Ping do


  def loop do

    receive  do
      {sender,"Pong"} -> send(sender,{self,"Ping"})
                        IO.puts "Pong"
      _ -> "Invalid"
    end
    loop
  end

end
