defmodule ProductsWeb.Resolver do
  @products [
    %{
      id: "apollo-federation",
      sku: "federation",
      package: "absinthe_federation",
      variation: "OSS"
    },
    %{
      id: "apollo-studio",
      sku: "studio",
      package: "",
      variation: "platform"
    }
  ]

  def products(_, _, _) do
    {:ok, @products}
  end

  def product(_, %{id: id}, _) do
    {:ok, @products |> Enum.find(&(&1.id == id))}
  end

  def product_dimension(_, _, _) do
    {:ok, %{size: "1", weight: 1}}
  end

  def user(_, _, _) do
    {:ok, %{email: "support@apollographql.com", total_products_created: 1337}}
  end
end
