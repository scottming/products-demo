defmodule ProductsWeb.Router do
  use ProductsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :graphql do
    plug Plug.RequestId
    plug Plug.Logger

    plug Plug.Parsers,
      parsers: [:urlencoded, :multipart, :json],
      pass: ["*/*"],
      json_decoder: Jason
  end

  scope "/" do
    pipe_through [:graphql]
    forward("/graphiql", Absinthe.Plug.GraphiQL, schema: ProductsWeb.Schema)
  end
end
