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
        metatype_min: ~x"./metatypemin/text()"i,
        metatype_max: ~x"./metatypemin/text()"i,
        metatype_aug_max: ~x"./metatypemin/text()"i,
        value: ~x"./value/text()"i,
        aug_modifier: ~x"./value/text()"i,
        total_value: ~x"./totalvalue/text()"i,
      ],
      skill_groups: [
        ~x"./skillgroups/skillgroup"l,
        name: ~x"./name/text()"s,
        rating: ~x"./rating/text()"i,
        rating_max: ~x"./ratingmax/text()"i,
        is_broken: ~x"./broken/text()"s,
      ],
      alias: ~x"./alias/text()"s,
      app_version: ~x"./appversion/text()"i
    )
  end

end
