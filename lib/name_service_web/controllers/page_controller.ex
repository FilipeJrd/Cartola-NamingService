defmodule NameServiceWeb.PageController do
  use NameServiceWeb, :controller

  def register(conn, params) do
    name = Map.get(params, "name")
    host = Map.get(params, "host")
    parameters = {name,host}
    case parameters do
        {nil, _} -> conn |> send_resp(:bad_request,"")
        {_, nil} -> conn |> send_resp(:bad_request,"")
        {name, host} ->
          :ok = NameService.Registry.register(name,host)
          conn |> send_resp(200, "")
    end
  end

  def lookup(conn, %{"name" => name}) do
    ip = NameService.Registry.lookup(name)
    text conn, ip
  end

  def lookup(conn, params) do 
    ips = NameService.Registry.list
    json conn, ips
  end
end
