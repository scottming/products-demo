defmodule Products.Product do
  use Ecto.Schema

  schema "products" do
    field(:sku, :string)
    field(:package, :string)
    field(:created_by, :id)
  end
end
