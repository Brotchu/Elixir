defmodule LetterFreq do
  @moduledoc """
  Documentation for LetterFreq.
  """

  @doc """
  Hello world.

  ## Examples

      iex> LetterFreq.hello()
      :world

  """
  def hello do
    :world
  end

  def count_each(text) do
    Letter_freq.Control.count_letters(text)
    |> Enum.each( fn({:ok,char,num}) -> IO.puts "#{char} - #{num}" end)
  end
end
