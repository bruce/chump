defmodule Chump.Web.Schema.Types do
  use Absinthe.Schema.Notation
  alias Chump.Web.Schema

  object :character do
    field :alias, :string
    field :attributes, list_of(:attribute)
    field :skill_groups, list_of(:skill_group) do
      arg :rated_only, :boolean, default_value: false
      resolve &Schema.Resolvers.SkillGroup.for_character/3
    end
  end

  object :attribute do
    field :aug_modifier, :integer
    field :metatype_aug_max, :integer
    field :metatype_max, :integer
    field :metatype_min, :integer
    field :name, :string
    field :total_value, :integer
    field :value, :integer
  end

  object :skill_group do
    field :name, :string
    field :rating, :integer
    field :rating_max, :integer
    field :is_broken, :boolean do
      resolve fn
        %{is_broken: "true"}, _, _  ->
          {:ok, true}
        %{is_broken: "false"}, _, _  ->
          {:ok, false}
      end
    end
  end

end
