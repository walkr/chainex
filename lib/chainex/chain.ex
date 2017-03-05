defmodule Chainex.Chain do
    @moduledoc """
    GenServer for interacting with the blockchain
    """

    use GenServer
    alias Chainex.Block

    defstruct blocks: []

    @genesis_block %Block{
        data: "genesis block",
        index: 0,
        prevHash: "0",
        timestamp: 1488693306600922756,
        hash: "c6d40c38458ee55e430715b81d434728716e6025ebea0b3537e73e7f18c62453"
    }


    ### INITIALIZATION ############################################


    def start_link(args, opts) do
        GenServer.start_link(__MODULE__, args, opts)
    end

    def init(_) do
        {:ok, %__MODULE__{blocks: [@genesis_block]}}
    end


    ### CALLBACK ############################################

    def handle_call({:get, :blocks}, _from, state) do
        {:reply, {:ok, state.blocks}, state}
    end

    def handle_call({:get, :block, :latest}, _from, state) do
        [block | _] = state.blocks
        {:reply, {:ok, block}, state}
    end

    def handle_call({:get, :block, :genesis}, _from, state) do
        {:reply, {:ok, @genesis_block}, state}
    end

    def handle_call({:get, :block, index}, _from, state) do
        [block] = Enum.filter(state.blocks, fn b -> b.index == index end)
        {:reply, {:ok, block}, state}
    end

    def handle_call({:store, :block, %Block{} = block}, _from, state) do
        {:reply, :ok, %{state | blocks: [block | state.blocks]}}
    end


    ### API ############################################


    def get_genesis_block() do
        GenServer.call(__MODULE__, {:get, :block, :genesis})
    end

    def get_latest_block() do
        GenServer.call(__MODULE__, {:get, :block, :latest})
    end

    def get_all_blocks() do
        GenServer.call(__MODULE__, {:get, :blocks})
    end

    def store_block(block) do
        GenServer.call(__MODULE__, {:store, :block, block})
    end

end