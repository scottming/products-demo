defmodule ProductsWeb.Resolver do
  import Ecto.Query
  alias Products.Repo
  import Absinthe.Resolution.Helpers, only: [batch: 3]

  def products(_, _, _) do
    products = Repo.all(Products.Product)
    {:ok, products}
  end

  def product(_, %{id: id}, _) do
    product = Repo.get(Products.Product, id)
    {:ok, product}
  end

  def product_dimensions(parent, _, _) do
    batch({__MODULE__, :product_dimensions_by_id}, parent.id, fn batch_results ->
      {:ok, Map.get(batch_results, parent.id)}
    end)
  end

  def product_dimensions_by_id(_, product_ids) do
    query = from(q in Products.ProductDimension, where: q.product_id in ^product_ids)
    query |> Repo.all() |> Enum.into(%{}, fn x -> {x.product_id, x} end)
  end

  def user(_, _, _) do
    Process.sleep(500)
    {:ok, %{email: "support@apollographql.com", total_products_created: 1337}}
  end

  def user_profile(_, _, _) do
    Process.sleep(100)
    {:ok, %{info: "user info"}}
  end
end
