defmodule ETL do

  @doc """
  Transforms an old Scrabble score system to a new one.

  ## Examples

    iex> ETL.transform(%{1 => ["A", "E"], 2 => ["D", "G"]})
    %{"a" => 1, "d" => 2, "e" => 1, "g" => 2}
  """
  @spec transform(map) :: map
  def transform(input) do
    # accepts a map.
    # input map has:
    #     an index key,
    #     a list value, that contains:
    #         single string words.
    # output map has:
    #     a string key.
    #     an integer value.

    # this seems broken out of the gate since a word like "bob"
    # will only record the score for a single 'b' and 'o' letters
    # none of the tests check this.

    # Iterate over map
    #   for each value of the list value, return a new entry 
    #     the value values are the items in that entry (lowercased)
    #       
    #       output to a new map.

    # old = %{
    #   1 => ~W(A E I O U L N R S T),
    #   2 => ~W(D G),
    #   3 => ~W(B C M P),
    #   4 => ~W(F H V W Y),
    #   5 => ~W(K),
    #   8 => ~W(J X),
    #   10 => ~W(Q Z)
    # }

    input
    |> Enum.flat_map(fn {letter_value, letters} ->
        Enum.map(letters, fn letter ->
          {String.downcase(letter), letter_value}
        end)
      end)
      |> Map.new() 
  end
end
