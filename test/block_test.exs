defmodule Chainex.BlockTest do

    use ExUnit.Case
    alias Chainex.Block

    test "create blockchain" do
        block = Block.new(:index, :data, :hash)
        assert block != nil
    end
end