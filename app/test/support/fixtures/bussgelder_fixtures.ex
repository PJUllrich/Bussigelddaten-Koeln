defmodule App.BussgelderFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.Bussgelder` context.
  """

  @doc """
  Generate a bussgeld.
  """
  def bussgeld_fixture(attrs \\ %{}) do
    {:ok, bussgeld} =
      attrs
      |> Enum.into(%{
        datum_von: ~N[2022-07-06 18:46:00],
        fabrikat: "some fabrikat",
        fahrzeugart: :pkw,
        hausnummer: "some hausnummer",
        kennzeichen: "some kennzeichen",
        strasse: "some strasse",
        tatbestand_1: 42,
        tatbestand_2: 42,
        tatbestand_3: 42
      })
      |> App.Bussgelder.create_bussgeld()

    bussgeld
  end

  @doc """
  Generate a ort.
  """
  def ort_fixture(attrs \\ %{}) do
    {:ok, ort} =
      attrs
      |> Enum.into(%{
        hausnummer: "some hausnummer",
        latitude: 120.5,
        longitude: 120.5,
        strasse: "some strasse"
      })
      |> App.Bussgelder.create_ort()

    ort
  end
end
