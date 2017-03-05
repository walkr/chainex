defmodule Chainex.Block do

    alias Chainex.Hasher

    defstruct index: nil, prevHash: nil, timestamp: nil, data: nil, hash: nil

    @doc """
    Return a new block struct with no data set
    """
    def new(index, prevHash),
        do: new(%{index: index, prevHash: prevHash})

    @doc """
    Return a new block struct from params
    """
    def new(params) do
        %__MODULE__{timestamp: :erlang.system_time()}
        |> struct(params)
        |> fn block -> struct(block, hash: Hasher.compute_hash(block)) end.()
    end

end