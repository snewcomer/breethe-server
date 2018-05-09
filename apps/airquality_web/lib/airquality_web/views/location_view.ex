defmodule AirqualityWeb.LocationView do
  use AirqualityWeb, :view
  use JaSerializer.PhoenixView

  attributes([:name, :city, :country, :last_updated, :coordinates])

  has_many(
    :measurements,
    links: [
      related: "/locations/:id/measurements"
    ]
  )

  defp name(struct, _conn), do: Map.get(struct, :identifier)
end

defimpl JaSerializer.Formatter, for: [Geo.Point] do
  def format(struct), do: Tuple.to_list(struct.coordinates)
end