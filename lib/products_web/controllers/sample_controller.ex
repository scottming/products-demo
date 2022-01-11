defmodule ProductsWeb.SampleController do
  use ProductsWeb, :controller

  def show(conn, %{"product" => id}) do
    # authenticated users only
    Process.sleep(800)

    json(conn, %{
      data: %{
        id: id,
        sku: "federation",
        package: "absinthe_federation",
        variation: "OSS"
      }
    })
  end
end
