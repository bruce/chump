defmodule Chump.Web.Schema do
  use Absinthe.Schema
  alias __MODULE__

  import_types Schema.Types

  query do

    field :character, :character do
      arg :name, non_null(:string)
      resolve &Schema.Resolvers.Character.find/3
    end

  end
end
