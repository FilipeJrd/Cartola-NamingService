defmodule NameService.Registry do
  use Agent

  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def register(name, ip) do
    Agent.update(__MODULE__, &Map.put(&1, name, ip))
  end

  def lookup(name) do
    Agent.get(__MODULE__, &Map.get(&1,name))
  end

  def list do
    Agent.get(__MODULE__, &(&1))
  end

  def unregister(name) do
    Agent.update(__MODULE__, &Map.delete(&1, name))
  end
end
