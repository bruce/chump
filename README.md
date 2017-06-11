# Chump

Just playing around with Chummer / SR4 files.

## Running it

After cloning it:

``` shell
$ mix do deps.get, deps.compile
$ mix ecto.setup
$ iex -S mix phx.server
```

Any character sheets in `priv/repo/seeds/sheets` should be loaded.

Hit http://localhost:4000/graphiql to use GraphiQL (point it at http://localhost:4000/api).

If you want to add more character sheets, you have two options:

1. Drop your `.chum` files in the directory noted above and run `mix ecto.reset`.
2. Add the sheets manually:

``` elixir
Chump.ChumFile.read!("/path/to/TheName.chum")
|> Chump.Character.add_sheet("TheName")
```
