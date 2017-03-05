defmodule Chainex.Block do

    defstruct index: nil, prevHash: nil, timestamp: nil, data: nil, hash: nil


    def new(index, hash, prevHash),
        do: new(%{index: index, hash: hash, prevHash: prevHash})

    def new(params) do
        %__MODULE__{timestamp: DateTime.utc_now()}
        |> struct(params)
    end

end