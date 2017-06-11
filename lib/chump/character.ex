defmodule Chump.Character do
  alias __MODULE__

  def add_sheet(data, name) do
    %Character.Sheet{}
    |> Character.Sheet.changeset(
      %{
        name: name,
        chummer_data: data
      })
      |> Chump.Repo.insert
  end

end
