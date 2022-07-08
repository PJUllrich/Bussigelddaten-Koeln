defmodule App.Repo.Migrations.CreateBussgelder do
  use Ecto.Migration

  def change do
    create table(:bussgelder) do
      add(:datum_von, :naive_datetime)
      add(:kennzeichen, :string)
      add(:fahrzeugart, :string)
      add(:fabrikat, :string)
      add(:strasse, :text)
      add(:hausnummer, :string)
      add(:tatbestand_1, :integer)
      add(:tatbestand_2, :integer)
      add(:tatbestand_3, :integer)
    end

    create(index(:bussgelder, [:datum_von]))
    create(index(:bussgelder, [:kennzeichen]))
    create(index(:bussgelder, [:fahrzeugart]))
    create(index(:bussgelder, [:fabrikat]))
    create(index(:bussgelder, [:strasse]))
    create(index(:bussgelder, [:strasse, :hausnummer]))
    create(index(:bussgelder, [:tatbestand_1]))
    create(index(:bussgelder, [:tatbestand_2]))
    create(index(:bussgelder, [:tatbestand_3]))
  end
end
