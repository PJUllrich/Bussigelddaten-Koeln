defmodule App.Bussgelder do
  @moduledoc """
  The Bussgelder context.
  """

  import Ecto.Query, warn: false
  alias App.Repo

  alias App.Bussgelder.Bussgeld

  @doc """
  Returns the list of bussgelder.

  ## Examples

      iex> list_bussgelder()
      [%Bussgeld{}, ...]

  """
  def list_bussgelder do
    Repo.all(Bussgeld)
  end

  @doc """
  Gets a single bussgeld.

  Raises `Ecto.NoResultsError` if the Bussgeld does not exist.

  ## Examples

      iex> get_bussgeld!(123)
      %Bussgeld{}

      iex> get_bussgeld!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bussgeld!(id), do: Repo.get!(Bussgeld, id)

  @doc """
  Creates a bussgeld.

  ## Examples

      iex> create_bussgeld(%{field: value})
      {:ok, %Bussgeld{}}

      iex> create_bussgeld(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bussgeld(attrs \\ %{}) do
    %Bussgeld{}
    |> Bussgeld.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bussgeld.

  ## Examples

      iex> update_bussgeld(bussgeld, %{field: new_value})
      {:ok, %Bussgeld{}}

      iex> update_bussgeld(bussgeld, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bussgeld(%Bussgeld{} = bussgeld, attrs) do
    bussgeld
    |> Bussgeld.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bussgeld.

  ## Examples

      iex> delete_bussgeld(bussgeld)
      {:ok, %Bussgeld{}}

      iex> delete_bussgeld(bussgeld)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bussgeld(%Bussgeld{} = bussgeld) do
    Repo.delete(bussgeld)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bussgeld changes.

  ## Examples

      iex> change_bussgeld(bussgeld)
      %Ecto.Changeset{data: %Bussgeld{}}

  """
  def change_bussgeld(%Bussgeld{} = bussgeld, attrs \\ %{}) do
    Bussgeld.changeset(bussgeld, attrs)
  end

  alias App.Bussgelder.Ort

  @doc """
  Returns the list of orte.

  ## Examples

      iex> list_orte()
      [%Ort{}, ...]

  """
  def list_orte do
    Repo.all(Ort)
  end

  @doc """
  Gets a single ort.

  Raises `Ecto.NoResultsError` if the Ort does not exist.

  ## Examples

      iex> get_ort!(123)
      %Ort{}

      iex> get_ort!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ort!(id), do: Repo.get!(Ort, id)

  @doc """
  Creates a ort.

  ## Examples

      iex> create_ort(%{field: value})
      {:ok, %Ort{}}

      iex> create_ort(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ort(attrs \\ %{}) do
    %Ort{}
    |> Ort.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ort.

  ## Examples

      iex> update_ort(ort, %{field: new_value})
      {:ok, %Ort{}}

      iex> update_ort(ort, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ort(%Ort{} = ort, attrs) do
    ort
    |> Ort.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ort.

  ## Examples

      iex> delete_ort(ort)
      {:ok, %Ort{}}

      iex> delete_ort(ort)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ort(%Ort{} = ort) do
    Repo.delete(ort)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ort changes.

  ## Examples

      iex> change_ort(ort)
      %Ecto.Changeset{data: %Ort{}}

  """
  def change_ort(%Ort{} = ort, attrs \\ %{}) do
    Ort.changeset(ort, attrs)
  end
end
