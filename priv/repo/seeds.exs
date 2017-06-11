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
  data = Chump.ChumFile.read!(path)
  {:ok, sheet} = Chump.Character.create_sheet(name, data)
  IO.puts sheet.name
end
