defmodule ProductsWeb.Resolver do
  alias Products.Repo

  def products(_, _, _) do
    products = Repo.all(Products.Product)
    {:ok, products}
  end

  def product(_, %{id: id}, _) do
    product = Repo.get(Products.Product, id)
    {:ok, product}
  end

  def product_dimension(_, _, _) do
    Process.sleep(500)
    {:ok, %{size: "1", weight: 1}}
  end

  def user(_, _, _) do
    Process.sleep(800)
    {:ok, %{email: "support@apollographql.com", total_products_created: 1337}}
  end

  def user_profile(_, _, _) do
    Process.sleep(100)
    {:ok, %{info: "user info"}}
  end
end
