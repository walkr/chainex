defmodule Chainex.Block do

    alias Chainex.Hasher
    alias Chainex.Chain

    defstruct index: nil, prevHash: nil, timestamp: nil, data: nil, hash: nil

    @doc """
    Return a new block struct with no data set
    """
    def new(index, data, prevHash),
        do: new(%{index: index, data: data, prevHash: prevHash})

    @doc """
    Return a new block struct from params
    """
    def new(params) do
        %__MODULE__{timestamp: :erlang.system_time()}
        |> struct(params)
        |> fn block -> struct(block, hash: Hasher.compute_hash(block)) end.()
    end

    @doc """
    Generate next block
    """
    def generate(data) do
        # Fetch previous block
        {:ok, prevBlock} = Chain.get_latest_block()

        # Store new block
        block = new(prevBlock.index + 1, data, prevBlock.hash)
        :ok = Chain.store_block(block)

        {:ok, block}
    end
end