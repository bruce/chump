defmodule Chump.ChumFile do

  def read(path) do
    with {:ok, data} <- File.read(path), do: decode(data)
  end

  def read!(path) do
    case read(path) do
      {:ok, data} ->
        data
      _ ->
        raise RuntimeError, "Could not read chumfile #{path}"
    end
  end

  def decode(data) do
    case :unicode.characters_to_binary(data, {:utf16, :little}, :unicode) do
      {:error, _} ->
        {:error, "Could not extract XML"}
      result ->
        {:ok, result}
    end
  end

end
