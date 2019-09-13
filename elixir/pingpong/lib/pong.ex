defmodule Pingpong.Pong do


  def loop(send_id) do

    send(send_id,{self,"Pong"})
    looper
  end

  def looper do
    receive  do
      {sender,"Ping"} -> send(sender,{self,"Pong"})
                        IO.puts "Ping"
      _ -> "Invalid"
      end
      looper
  end

end
