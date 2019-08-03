defmodule RNA do
  def check_complement(dna) do
    complement(dna)
  end

  defp complement('A'),do: 'U'
  defp complement('T'),do: 'A'
  defp complement('C'),do: 'G'
  defp complement('G'),do: 'C'
  defp complement(_),do: "invalid"
end
