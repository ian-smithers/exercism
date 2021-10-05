defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) when length(strand1) == length(strand2) do
    # generate list of collisions and then count them.
    distance = strand1
      |> Enum.zip(strand2)
      |> Enum.map(fn {k, v} -> if k == v, do: 1, else: 0 end)
      |> Enum.count(fn x -> x == 0 end)
    {:ok, distance}
  end

  def hamming_distance(strand1, strand2) do
    {:error, "strands must be of equal length"} # erk.
  end
end
