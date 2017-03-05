defmodule Chainex.BlockTest do

    use ExUnit.Case
    alias Chainex.Block

    setup_all do
        Application.ensure_all_started(:chainex)
    end

    test "create blockchain" do
        block = Block.new(1, :data, :hash)
        assert block != nil
    end

    test "block generation" do
        {:ok, block} = Block.generate("my block data")
        assert block.data == "my block data"
        assert block.index != nil
    end



end