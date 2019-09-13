defmodule Weather.Coordinator do

  def loop(results \\ [], num_results) do

    receive do
      {:ok,result} ->
        new_results = [result|results]
        if num_results == Enum.count(new_results) do
          send( self(), :exit)
        end
        loop(new_results,num_results)
      :exit ->
        IO.puts(results |> Enum.sort |> Enum.join(", " ) )
      _->
        loop(results,num_results)
    end
  end


end
