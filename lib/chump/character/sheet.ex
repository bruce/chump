defmodule Chump.Character.Sheet do
  use Ecto.Schema
  import Ecto.Changeset
  alias Chump.Character.Sheet


  schema "sheets" do
    field :chummer_data, :map
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Sheet{} = sheet, attrs) do
    sheet
    |> cast(attrs, [:name, :chummer_data])
    |> validate_required([:name, :chummer_data])
  end
end
