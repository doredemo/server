defmodule Server.Workers.FishPricesWorker do
    use GenServer

    def handle_info(msg, state) do
        payload = %{ :price => 20.13 }
        Server.Endpoint.broadcast("fish_prices:lobby", "quotation", payload)
        Process.send_after(self(), "get_quotation", 1000)
        {:noreply, state: state}
    end

    def start_link() do
        {:ok, pid} = GenServer.start_link(Server.Workers.FishPricesWorker, [])
        Process.send_after(pid, "get_quotation", 1000)
        {:ok, pid}
    end
end
