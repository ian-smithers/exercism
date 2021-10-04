defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @dna_to_rna_map %{
      ?A => ?U,
      ?C => ?G,
      ?G => ?C,
      ?T => ?A
    }

  @spec to_rna([]) :: []
  def to_rna(dna) when length(dna) == 0, do: ''

  @spec to_rna(integer) :: [char]
  def to_rna(dna) when is_integer(dna) do
    @dna_to_rna_map[dna]
  end  
  
  @spec to_rna([char]) :: [char]
  def to_rna([head | tail]) do
    [to_rna(head) | to_rna(tail)]
  end
end
