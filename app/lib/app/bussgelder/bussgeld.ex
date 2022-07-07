defmodule App.Bussgelder.Bussgeld do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bussgelder" do
    field :datum_von, :naive_datetime
    field :fabrikat, :string
    field :fahrzeugart, Ecto.Enum, values: [:pkw, :lkw]
    field :hausnummer, :string
    field :kennzeichen, :string
    field :strasse, :string
    field :tatbestand_1, :integer
    field :tatbestand_2, :integer
    field :tatbestand_3, :integer

    timestamps()
  end

  @doc false
  def changeset(bussgeld, attrs) do
    bussgeld
    |> cast(attrs, [:datum_von, :kennzeichen, :fahrzeugart, :fabrikat, :strasse, :hausnummer, :tatbestand_1, :tatbestand_2, :tatbestand_3])
    |> validate_required([:datum_von, :kennzeichen, :fahrzeugart, :fabrikat, :strasse, :hausnummer, :tatbestand_1, :tatbestand_2, :tatbestand_3])
  end
end
