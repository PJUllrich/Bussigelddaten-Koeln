defmodule App.Repo.Migrations.CreateBussgelder do
  use Ecto.Migration

  def change do
    create table(:bussgelder) do
      add :datum_von, :naive_datetime
      add :kennzeichen, :string
      add :fahrzeugart, :string
      add :fabrikat, :string
      add :strasse, :text
      add :hausnummer, :string
      add :tatbestand_1, :integer
      add :tatbestand_2, :integer
      add :tatbestand_3, :integer

      timestamps()
    end
  end
end
