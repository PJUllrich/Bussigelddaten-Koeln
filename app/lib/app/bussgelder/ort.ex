defmodule App.Bussgelder.Ort do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orte" do
    field(:strasse, :string)
    field(:hausnummer, :string)
    field(:latitude, :float)
    field(:longitude, :float)
  end

  @doc false
  def changeset(ort, attrs) do
    ort
    |> cast(attrs, [:strasse, :hausnummer, :latitude, :longitude])
    |> validate_required([:strasse, :hausnummer, :latitude, :longitude])
  end
end
