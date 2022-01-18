defmodule ProductsWeb.Schema do
  use Absinthe.Schema
  alias ProductsWeb.Resolver
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  query do
    field :all_products, list_of(:product) do
      resolve(&Resolver.products/3)
    end

    field :product, :product do
      arg(:id, non_null(:id))
      resolve(&Resolver.product/3)
    end
  end

  object :product do
    field(:id, non_null(:id))
    field(:sku, :string)
    field(:package, :string)

    field :dimensions, list_of(:product_dimension), resolve: dataloader(Products.Core)

    field(:created_by, :user) do
      resolve(&Resolver.user/3)
    end
  end

  object :product_dimension do
    field(:size, :string)
    field(:weight, :integer)
  end

  object :user do
    field(:email, non_null(:id))
    field(:total_products_created, :integer)

    field :profile, :user_profile do
      resolve(&Resolver.user_profile/3)
    end
  end

  object :user_profile do
    field :info, :string do
    end
  end

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Products.Core, Products.Core.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
