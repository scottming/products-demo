defmodule Products.ProductDimension do
  use Ecto.Schema

  schema "product_dimensions" do
    field :size, :string
    field :weight, :integer
    belongs_to(:product, Products.Product)
  end
end
