defmodule Robot.Control do


  def move_robot(str) do
    str
    |> String.codepoints
    |> controller
  end

  def controller(command_list) do
    robo_id = spawn(Robot.Movement, :loop, [])
    control(command_list,{0,0,"N"}, robo_id)
  end

  def control([head|tail],{x,y,face},robot_control_id) do
      send( robot_control_id, {self,{head, {x,y,face}}} )
      receive do
        {p,q,facing} -> control(tail,{p,q,facing}, robot_control_id)
        _ -> "Invalid"
      end
  end
  def control([], {x,y,face}, _), do: {x,y,face}

end
