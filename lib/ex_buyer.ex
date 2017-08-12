defmodule ExEx.Buyers.Buyer do
  use GenServer

  def start_link(id, amount, price) do
    GenServer.start_link(__MODULE__, [id, amount, price], name: name(id))
  end
  
  def status(id) do
    name(id) |> 
    GenServer.call(:status)
  end 
  
  def sell_intention(id, from, amount, price) do
    name(id) |>
    GenServer.cast({:sell_intention, from, amount, price})
  end
  

################################################################################  
  def init([id, amount, price]) do
    Registry.register(ExEx.Buyers.All, :buyers, [])
    {:ok, %{initial_state() | id: id, amount: amount, price: price}}
  end
  

  def handle_call(:status, _from, state) do
    {:reply, state, state}
  end
  
  def handle_cast({:sell_intention, from, sell_amount, sell_price}, #{) ->
    
  end


################################################################################  
  defp initial_state() do
    %{pending_buys: [], bought: [], id: nil, amount: nil, price: nil}
  end
  
  defp name(id) do
    {:via, Registry, {ExEx.Buyers.Registry, id}}
  end
  
  
  
end
