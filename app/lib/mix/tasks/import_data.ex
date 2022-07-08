defmodule Mix.Tasks.ImportData do
  use Mix.Task

  require Logger

  def run(["bussgelder", path]) do
    command =
      "COPY bussgelder(datum_von,kennzeichen,fahrzeugart,fabrikat,strasse,hausnummer,tatbestand_1,tatbestand_2,tatbestand_3) FROM STDIN CSV HEADER DELIMITER ';' "

    do_import(command, path)
  end

  def run(["orte", path]) do
    command =
      "COPY orte(strasse,hausnummer,latitude,longitude) FROM STDIN CSV HEADER DELIMITER ';' "

    do_import(command, path)
  end

  defp do_import(command, path) do
    Mix.Task.run("app.start", [])

    opts = App.Repo.config()
    {:ok, pid} = Postgrex.start_link(opts)

    Postgrex.transaction(
      pid,
      fn conn ->
        stream = Postgrex.stream(conn, command, [])

        Enum.into(File.stream!(path, [:trim_bom]), stream)
      end,
      timeout: 60000
    )
  end
end
