defmodule ExEx.Buyers.Sup do
  use Supervisor  

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end


  def start_buyer(id, amount, price) do
    spec = worker(ExEx.Buyers.Buyer, [id, amount, price], id: id, restart: :transient)
    Supervisor.start_child(__MODULE__, spec)
  end
  
  
  def init(:ok) do
    children = [
      worker(Registry, [:unique, ExEx.Buyers.Registry]),
      worker(Registry, [:duplicate, ExEx.Buyers.All])      
    ]

    supervise(children, strategy: :one_for_one)
  end 


  

end
