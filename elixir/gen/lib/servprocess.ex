defmodule Gen.Servprocess do

  use GenServer


  def start_link(def_list) when is_list(def_list) do
    GenServer.start_link(__MODULE__, def_list)
  end

  def pop(pid) do
    GenServer.call(pid, :pop )
  end

  def push(pid, element) do
    GenServer.cast(pid,{:push, element})
  end

  #Server side, -- callbacks

    @impl true
    def init(stack) do
      {:ok, stack}
    end

    @impl true
    def handle_call(:pop,_from, [head|tail]) do
      {:reply, head, tail}
    end

    @impl_true
    def handle_cast({:push, element}, state ) do
      {:noreply, [element|state]}
    end

end
