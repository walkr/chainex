defmodule Chainex.ChainTest do

    use ExUnit.Case
    alias Chainex.Block
    alias Chainex.Chain

    setup_all do
        Application.ensure_all_started(:chainex)
    end

    test "get latest block" do
        {:ok, block} = Chain.get_latest_block()
        assert block != nil
    end

    test "get all blocks" do
        {:ok, genesis} = Chain.get_genesis_block()
        {:ok, blocks} = Chain.get_all_blocks()
        assert [genesis] == blocks
    end

    test "get genesis block" do
        {:ok, block} = Chain.get_genesis_block()
        assert block != nil
    end

    test "store and get latest block" do
        block = Block.new(:index, :data, :invalid)
        :ok = Chain.store_block(block)
        {:ok, latest} = Chain.get_latest_block()
        assert block == latest
    end


end