# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Chump.Repo.insert!(%Chump.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

for path <- Path.wildcard("priv/repo/seeds/sheets/*.chum") do
  name = Path.basename(path, ".chum")
  {:ok, _} =
    Chump.ChumFile.read!(path)
    |> Chump.Character.add_sheet(name)
  IO.puts name
end
