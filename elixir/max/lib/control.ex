defmodule Max.Control do

def loop(list) do

  worker_id= spawn(Max.Worker, :loop, [])
  send(worker_id,{self,list})
  receive do
    {:ok,max} -> max
  end
end

end
