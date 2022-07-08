defmodule Mix.Tasks.GeocodeData do
  use Mix.Task

  require Logger

  @azure_search_endpoint "https://atlas.microsoft.com/search/address/json"

  @col %{
    strasse: 0,
    hausnummer: 1
  }

  def run([path]) do
    HTTPoison.start()
    open_file(path)
  end

  defp open_file(path) do
    output = File.stream!("../Daten/Alle-Orte-mit-Lat-Long.csv", [:append, :utf8])

    path
    |> File.stream!()
    |> CSV.decode(separator: ?;)
    |> Stream.with_index()
    |> Stream.map(&geocode_row/1)
    |> CSV.encode()
    |> Stream.into(output)
    |> Stream.run()
  end

  defp geocode_row({{:ok, row}, 0}) do
    row ++ ["Latitude", "Longitude"]
  end

  defp geocode_row({{:ok, row}, _idx}) do
    with {:ok, adresse} <- erstelle_adresse(row),
         {:ok, %{"lat" => lat, "lon" => lon}} <- get_location(adresse) do
      row ++ [lat, lon]
    else
      _error ->
        row ++ [0, 0]
    end
  end

  defp geocode_row(row) do
    Logger.error(row)
    row
  end

  defp erstelle_adresse(row) do
    strasse = Enum.at(row, @col.strasse)
    hausnummer = Enum.at(row, @col.hausnummer)

    {:ok, "#{strasse} #{hausnummer}, Köln"}
  end

  def get_location(adresse) do
    params = %{
      query: adresse,
      "subscription-key": subscription_key(),
      "api-version": 1.0,
      countrySet: "DE",
      limit: 1,
      lat: 50.943344,
      long: 6.957017,
      radius: 20_000
    }

    with %{status_code: 200} = res <-
           HTTPoison.get!(@azure_search_endpoint, [], params: params, recv_timeout: 15_000),
         %{"results" => [%{"position" => position}]} <- Jason.decode!(res.body) do
      {:ok, position}
    else
      %{"results" => []} ->
        {:error, adresse}

      res ->
        error = res.body |> Jason.decode!()
        Logger.error(error)
        {:error, error}
    end
  end

  defp subscription_key do
    System.get_env("SUBSCRIPTION_KEY")
  end
end
