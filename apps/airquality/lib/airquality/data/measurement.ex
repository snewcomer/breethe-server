defmodule Airquality.Data.Measurement do
  use Ecto.Schema
  import Ecto.Changeset
  alias Airquality.Data.{Measurement, Location}

  schema "measurements" do
    belongs_to(:location, Location)
    field(:parameter, ParameterEnum)
    field(:measured_at, :utc_datetime)
    field(:value, :float)
    field(:unit, UnitEnum)

    timestamps()
  end

  @doc false
  def changeset(%Measurement{} = measurement, attrs) do
    measurement
    |> cast(attrs, [:location_id, :parameter, :measured_at, :value, :unit])
    |> cast_assoc(:location)
    |> validate_required([:location_id, :parameter, :measured_at, :value, :unit])
  end
end
