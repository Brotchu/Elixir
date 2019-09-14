defmodule Robot.Movement do


def loop() do
  receive do
    {control_id,{command, {x1,y1,face1}} } -> send(control_id, move_robot({x1,y1,face1},command))
    _ -> "Invalid"
  end
  loop
end

def move_robot({x,y,"N"}, "R"), do: {x,y,"E"}
def move_robot({x,y,"E"}, "R"), do: {x,y,"S"}
def move_robot({x,y,"S"}, "R"), do: {x,y,"W"}
def move_robot({x,y,"W"}, "R"), do: {x,y,"N"}
def move_robot({x,y,"N"}, "L"), do: {x,y,"W"}
def move_robot({x,y,"W"}, "L"), do: {x,y,"S"}
def move_robot({x,y,"S"}, "L"), do: {x,y,"E"}
def move_robot({x,y,"E"}, "L"), do: {x,y,"N"}
def move_robot({x,y,"N"}, "A"), do: {x,y+1, "N"}
def move_robot({x,y,"S"}, "A"), do: {x,y-1, "S"}
def move_robot({x,y,"W"}, "A"), do: {x-1,y, "W"}
def move_robot({x,y,"E"}, "A"), do: {x+1,y, "E"}

end
