defmodule ListFilter do
  require Integer

  def call(list) do
    list
    |> Enum.filter(fn string -> isInteger?(Integer.parse(string)) end)
    |> Enum.map(fn string -> toInteger(string) end)
    |> Enum.filter(fn number -> Integer.is_odd(number) end)
    |> length()
  end

  defp isInteger?(:error), do: false
  defp isInteger?({_int, _str}), do: true

  defp toInteger(string) do
    {number, _str} = Integer.parse(string)

    number
  end
end
