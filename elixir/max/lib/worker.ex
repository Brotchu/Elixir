defmodule Max.Worker do



def loop() do
  receive do
    {control_id,list} ->  send(control_id,{ :ok, Enum.max(list) })
    _ -> "Invalid"

  end
  loop
end

end
