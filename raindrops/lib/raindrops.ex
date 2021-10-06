defmodule Raindrops do
  @factor_string_map %{3 => "Pling", 5 => "Plang", 7 => "Plong"}

  @spec factor(pos_integer, pos_integer) :: String.t()
  defp factor(number, factor) when rem(number, factor) == 0 do
      @factor_string_map[factor]
  end

  defp factor(_number, _factor) do
    ""
  end

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """ 

  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    sounds = factor(number, 3) <> factor(number, 5) <> factor(number, 7)
    if sounds == "", do: to_string(number), else: sounds
  end
end
