defmodule Weather do
  @moduledoc """
  Documentation for Weather.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Weather.hello()
      :world

  """
  def hello do
    :world
  end

  def temp_of(cities) do

    coord_pid = spawn(Weather.Coordinator, :loop, [[],Enum.count(cities)])

    cities |> Enum.each(fn x -> worker_pid = spawn(Weather.Worker, :loop, [])
                                send(worker_pid, {coord_pid, x})
                                  end)

  end


end
