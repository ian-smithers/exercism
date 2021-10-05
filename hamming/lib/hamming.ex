defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) do
    cond do
      length(strand1) == length(strand2) -> 
        # generate list of collisions and then count them.
        distance = Enum.zip(strand1, strand2)
          |> Enum.map(fn {k, v} -> if k == v, do: 1, else: 0 end)
          |> Enum.count(&(&1 != 1))
        {:ok, distance}
      true -> {:error, "strands must be of equal length"} # erk.
    end
  end
end
