defmodule Chump.Character.Sheet do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__

  import SweetXml, only: [sigil_x: 2]

  schema "sheets" do
    field :chummer_data, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Sheet{} = sheet, attrs) do
    sheet
    |> cast(attrs, [:name, :chummer_data])
    |> validate_required([:name, :chummer_data])
  end

  def info(sheet) do
    sheet.chummer_data
    |> SweetXml.xpath(
      ~x"//character",
      attributes: [
        ~x"./attributes/attribute"l,
        name: ~x"./name/text()"s,
        metatypemin: ~x"./metatypemin/text()"i,
        metatypemax: ~x"./metatypemin/text()"i,
        metatypeaugmax: ~x"./metatypemin/text()"i,
        value: ~x"./value/text()"i,
        augmodifier: ~x"./value/text()"i,
        totalvalue: ~x"./totalvalue/text()"i,
      ],
      alias: ~x"./alias/text()"s,
      appversion: ~x"./appversion/text()"i
    )
  end

end
