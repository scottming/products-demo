defmodule Products.Repo.Migrations.CreateProductDimensions do
  use Ecto.Migration

  def change do
    create table("product_dimensions") do
      add :size, :string
      add :weight, :integer
      add :product_id, references(:products)
      timestamps()
    end
  end
end
