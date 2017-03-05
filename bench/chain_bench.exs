defmodule ChainBench do

    use Benchfella
    alias Chainex.Block
    alias Chainex.Chain

    setup_all do
        Application.ensure_all_started(:chainex)
    end

    before_each_bench context do
        {:ok, context}
    end

    bench "block :: generation" do
        {:ok, block} = Block.generate("my-data")
        block.data
    end

    bench "block :: fetch latest block" do
        {:ok, block} = Chain.get_latest_block()
        block.data
    end

end