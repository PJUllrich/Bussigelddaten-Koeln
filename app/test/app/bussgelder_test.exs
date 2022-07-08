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

  describe "orte" do
    alias App.Bussgelder.Ort

    import App.BussgelderFixtures

    @invalid_attrs %{hausnummer: nil, latitude: nil, longitude: nil, strasse: nil}

    test "list_orte/0 returns all orte" do
      ort = ort_fixture()
      assert Bussgelder.list_orte() == [ort]
    end

    test "get_ort!/1 returns the ort with given id" do
      ort = ort_fixture()
      assert Bussgelder.get_ort!(ort.id) == ort
    end

    test "create_ort/1 with valid data creates a ort" do
      valid_attrs = %{hausnummer: "some hausnummer", latitude: 120.5, longitude: 120.5, strasse: "some strasse"}

      assert {:ok, %Ort{} = ort} = Bussgelder.create_ort(valid_attrs)
      assert ort.hausnummer == "some hausnummer"
      assert ort.latitude == 120.5
      assert ort.longitude == 120.5
      assert ort.strasse == "some strasse"
    end

    test "create_ort/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bussgelder.create_ort(@invalid_attrs)
    end

    test "update_ort/2 with valid data updates the ort" do
      ort = ort_fixture()
      update_attrs = %{hausnummer: "some updated hausnummer", latitude: 456.7, longitude: 456.7, strasse: "some updated strasse"}

      assert {:ok, %Ort{} = ort} = Bussgelder.update_ort(ort, update_attrs)
      assert ort.hausnummer == "some updated hausnummer"
      assert ort.latitude == 456.7
      assert ort.longitude == 456.7
      assert ort.strasse == "some updated strasse"
    end

    test "update_ort/2 with invalid data returns error changeset" do
      ort = ort_fixture()
      assert {:error, %Ecto.Changeset{}} = Bussgelder.update_ort(ort, @invalid_attrs)
      assert ort == Bussgelder.get_ort!(ort.id)
    end

    test "delete_ort/1 deletes the ort" do
      ort = ort_fixture()
      assert {:ok, %Ort{}} = Bussgelder.delete_ort(ort)
      assert_raise Ecto.NoResultsError, fn -> Bussgelder.get_ort!(ort.id) end
    end

    test "change_ort/1 returns a ort changeset" do
      ort = ort_fixture()
      assert %Ecto.Changeset{} = Bussgelder.change_ort(ort)
    end
  end
end
