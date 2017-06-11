defmodule Chump.Repo.Migrations.CreateChump.Character.Sheet do
  use Ecto.Migration

  def change do
    create table(:sheets) do
      add :name, :string
      add :chummer_data, :text

      timestamps()
    end

  end
end
