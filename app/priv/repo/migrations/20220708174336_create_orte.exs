defmodule App.Repo.Migrations.CreateOrte do
  use Ecto.Migration

  def change do
    create table(:orte) do
      add(:strasse, :text)
      add(:hausnummer, :string)
      add(:latitude, :float)
      add(:longitude, :float)
    end

    create(index(:orte, [:strasse, :hausnummer]))
    create(index(:orte, [:latitude, :longitude]))
  end
end
