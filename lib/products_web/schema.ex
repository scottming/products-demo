defmodule ProductsWeb.Schema do
  use Absinthe.Schema
  alias ProductsWeb.Resolver

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
    field :id, non_null(:id)
    field :sku, :string
    field :package, :string

    field :dimensions, :product_dimension do
      resolve(&Resolver.product_dimension/3)
    end

    field :created_by, :user do
      resolve(&Resolver.user/3)
    end
  end

  object :product_dimension do
    field :size, :string
    field :weight, :integer
  end

  object :user do
    field :email, non_null(:id)
    field :total_products_created, :integer

    field :profile, :user_profile do
      resolve(&Resolver.user_profile/3)
    end
  end

  object :user_profile do
    field :info, :string do
    end
  end

  # def middleware(middleware, _field, _object) do
  #   [NewRelic.Absinthe.Middleware | middleware]
  # end
end
