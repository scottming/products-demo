defmodule Products.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table("products") do
      add(:sku, :string)
      add(:package, :string)
      add(:created_by, :integer)
      timestamps()
    end
  end
end
