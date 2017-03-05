defmodule Chainex.Hasher do

    alias Chainex.Block

    @doc """
    Compute hash of block
    """
    def compute_hash(%Block{} = block) do
        block
        |> content()
        |> :erlang.term_to_binary
        |> fn bin -> :crypto.hash(:sha256, bin) end.()
        |> Base.encode16(case: :lower)
    end

    defp content(block),
         do: %{index: block.index,
               timestamp: block.timestamp,
               prevHash: block.prevHash,
               data: block.data}



end