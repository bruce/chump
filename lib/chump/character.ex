defmodule Chump.Character do
  alias __MODULE__

  def create_sheet(name, data) do
    %Character.Sheet{}
    |> Character.Sheet.changeset(
      %{
        name: name,
        chummer_data: data
      })
      |> Chump.Repo.insert
  end

end
