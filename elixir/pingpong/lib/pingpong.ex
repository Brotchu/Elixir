defmodule Pingpong do
  @moduledoc """
  Documentation for Pingpong.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Pingpong.hello()
      :world

  """
  def hello do
    :world
  end

  def coordinator do
    ping_id = spawn(Pingpong.Ping, :loop, [])
    pong_id = spawn(Pingpong.Pong, :loop, [ping_id])
  end
end
