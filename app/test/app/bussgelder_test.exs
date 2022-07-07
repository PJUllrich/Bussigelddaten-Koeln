defmodule App.BussgelderTest do
  use App.DataCase

  alias App.Bussgelder

  describe "bussgelder" do
    alias App.Bussgelder.Bussgeld

    import App.BussgelderFixtures

    @invalid_attrs %{datum_von: nil, fabrikat: nil, fahrzeugart: nil, hausnummer: nil, kennzeichen: nil, strasse: nil, tatbestand_1: nil, tatbestand_2: nil, tatbestand_3: nil}

    test "list_bussgelder/0 returns all bussgelder" do
      bussgeld = bussgeld_fixture()
      assert Bussgelder.list_bussgelder() == [bussgeld]
    end

    test "get_bussgeld!/1 returns the bussgeld with given id" do
      bussgeld = bussgeld_fixture()
      assert Bussgelder.get_bussgeld!(bussgeld.id) == bussgeld
    end

    test "create_bussgeld/1 with valid data creates a bussgeld" do
      valid_attrs = %{datum_von: ~N[2022-07-06 18:46:00], fabrikat: "some fabrikat", fahrzeugart: :pkw, hausnummer: "some hausnummer", kennzeichen: "some kennzeichen", strasse: "some strasse", tatbestand_1: 42, tatbestand_2: 42, tatbestand_3: 42}

      assert {:ok, %Bussgeld{} = bussgeld} = Bussgelder.create_bussgeld(valid_attrs)
      assert bussgeld.datum_von == ~N[2022-07-06 18:46:00]
      assert bussgeld.fabrikat == "some fabrikat"
      assert bussgeld.fahrzeugart == :pkw
      assert bussgeld.hausnummer == "some hausnummer"
      assert bussgeld.kennzeichen == "some kennzeichen"
      assert bussgeld.strasse == "some strasse"
      assert bussgeld.tatbestand_1 == 42
      assert bussgeld.tatbestand_2 == 42
      assert bussgeld.tatbestand_3 == 42
    end

    test "create_bussgeld/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bussgelder.create_bussgeld(@invalid_attrs)
    end

    test "update_bussgeld/2 with valid data updates the bussgeld" do
      bussgeld = bussgeld_fixture()
      update_attrs = %{datum_von: ~N[2022-07-07 18:46:00], fabrikat: "some updated fabrikat", fahrzeugart: :lkw, hausnummer: "some updated hausnummer", kennzeichen: "some updated kennzeichen", strasse: "some updated strasse", tatbestand_1: 43, tatbestand_2: 43, tatbestand_3: 43}

      assert {:ok, %Bussgeld{} = bussgeld} = Bussgelder.update_bussgeld(bussgeld, update_attrs)
      assert bussgeld.datum_von == ~N[2022-07-07 18:46:00]
      assert bussgeld.fabrikat == "some updated fabrikat"
      assert bussgeld.fahrzeugart == :lkw
      assert bussgeld.hausnummer == "some updated hausnummer"
      assert bussgeld.kennzeichen == "some updated kennzeichen"
      assert bussgeld.strasse == "some updated strasse"
      assert bussgeld.tatbestand_1 == 43
      assert bussgeld.tatbestand_2 == 43
      assert bussgeld.tatbestand_3 == 43
    end

    test "update_bussgeld/2 with invalid data returns error changeset" do
      bussgeld = bussgeld_fixture()
      assert {:error, %Ecto.Changeset{}} = Bussgelder.update_bussgeld(bussgeld, @invalid_attrs)
      assert bussgeld == Bussgelder.get_bussgeld!(bussgeld.id)
    end

    test "delete_bussgeld/1 deletes the bussgeld" do
      bussgeld = bussgeld_fixture()
      assert {:ok, %Bussgeld{}} = Bussgelder.delete_bussgeld(bussgeld)
      assert_raise Ecto.NoResultsError, fn -> Bussgelder.get_bussgeld!(bussgeld.id) end
    end

    test "change_bussgeld/1 returns a bussgeld changeset" do
      bussgeld = bussgeld_fixture()
      assert %Ecto.Changeset{} = Bussgelder.change_bussgeld(bussgeld)
    end
  end
end
