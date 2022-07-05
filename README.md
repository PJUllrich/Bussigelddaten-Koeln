# Bussigelddaten Koeln

This repo contains `Bußgelddaten` (Data of parking fines) for Cologne, Germany.

The data was downloaded here: [2020](https://www.offenedaten-koeln.de/dataset/bu%C3%9Fgelddaten-koeln-2020), [2021](https://www.offenedaten-koeln.de/dataset/bu%C3%9Fgelddaten-koeln-2021).


The parking fine codes can be translated to useful names using the `tatbestandskatalog.pdf` [(Download link)](https://www.kba.de/DE/Themen/ZentraleRegister/FAER/BT_KAT_OWI/bkat_owi_09_11_2021.pdf;jsessionid=8FDF614EB006645B36151723681DA346.live21322?__blob=publicationFile&v=3).

## Setup for local development
First, you need to install `Elixir`. See [here](https://elixir-lang.org/install.html).

For running `Scripts`, you need to install `Livebook`. See [here](https://livebook.dev/#install). 

If you get this error: 
```
zsh: command not found: livebook
```

then reshim your elixir with `asdf reshim elixir`.

After all this is installed, you can run `livebook server`, open the Livebook, and run any script from the `Script`-folder.