defmodule Chump.Web.Schema.Resolvers.SkillGroup do
  import Ecto.Query

  def for_character(source, %{rated_only: false}, _) do
    {:ok, source.skill_groups}
  end
  def for_character(source, %{rated_only: true}, _) do
    skill_groups =
      source.skill_groups
      |> Enum.filter(&(&1.rating > 0))
    {:ok, skill_groups}
  end

end
