defmodule ExEx.Buyers do

  def new(amount, price) do
    id = uuid()
    IO.puts ("new #{id}")
    {:ok, _} = ExEx.Buyers.Sup.start_buyer(id, amount, price)
    id
  end

  def publish_sell(amount, price) do
    Registry.dispatch(ExEx.Buyers.All, :buyers, fn entries ->
      for 
  end
  

  defp uuid() do
    UUID.uuid4()
  end
  


    
end

