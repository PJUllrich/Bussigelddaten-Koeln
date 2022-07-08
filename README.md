# Bussigelddaten Koeln

This repo contains `Bußgelddaten` (Data of parking fines) for Cologne, Germany.

The data was downloaded here: [2020](https://www.offenedaten-koeln.de/dataset/bu%C3%9Fgelddaten-koeln-2020), [2021](https://www.offenedaten-koeln.de/dataset/bu%C3%9Fgelddaten-koeln-2021).


The parking fine codes can be translated to useful names using the `tatbestandskatalog.pdf` [(Download link)](https://www.kba.de/DE/Themen/ZentraleRegister/FAER/BT_KAT_OWI/bkat_owi_09_11_2021.pdf;jsessionid=8FDF614EB006645B36151723681DA346.live21322?__blob=publicationFile&v=3).

## Scripts
There are a few Bash and Elixir scripts in this repo. Here is what they do and how to use them:

### Combine all monthly datasets into a single file
This script combines all monthly datasets into a single `Komplett_YEAR.csv` per year.

You can run it by first making it executable with 

```
chmod 755 ./Scripts/combine_files.sh
```

and then running the script with:

```
cd Scripts
./combine_files.sh
```

### Import Data into the Database
You can easily import the data into a local Postgres database using `Mix.Tasks.ImportData`.

First, make sure that you have a Postgres instance running and it is available at `http://localhost:5432`.

Next, set up the Phoenix application:

```
cd app
mix deps.get
mix ecto.setup
```

This will fetch the dependencies and set up a local `bussgelder_dev` database.

Now, you can import the data with:

```
mix import_data bussgelder ../Daten/2020/Komplett_2020.csv
mix import_data bussgelder ../Daten/2021/Komplett_2021.csv
```

This will import all data into the database and create indices for all columns.

You can also import all locations with their latitude and longitude with:

```
mix import_data orte ../Daten/Alle-Orte-mit-Lat-Long.csv
```