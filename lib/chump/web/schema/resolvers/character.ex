defmodule Chump.Web.Schema.Resolvers.Character do
  import Ecto.Query

  def find(_, %{name: name}, _) do
    result =
      from(
        t in Chump.Character.Sheet,
        where: t.name == ^name,
      )
      |> Chump.Repo.one
    {:ok, result |> info}
  end

  defp info(nil) do
    nil
  end
  defp info(%Chump.Character.Sheet{} = sheet) do
    sheet
    |> Chump.Character.Sheet.info
  end

end
