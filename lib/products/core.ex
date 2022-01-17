defmodule Products.Core do
  def data() do
    Dataloader.Ecto.new(Products.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end
end
