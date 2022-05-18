module GPCCData

    using DelimitedFiles, Printf, JLD2, PyPlot

    include("readdatasets.jl")

    include("listdatasets.jl")

    include("plotdataset.jl")

    include("readvirialdatasets.jl")

    include("readpgdatasets.jl")

    export readdataset, listdatasets, plotdataset

end
