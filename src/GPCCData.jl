module GPCCData

    using DelimitedFiles, Printf, JLD2, PyPlot

    include("readdatasets.jl")

    include("listdatasets.jl")

    include("plotdataset.jl")

    include("readvirialdatasets.jl")

    include("readpgdatasets.jl")

    include("readNGC5548datasetdatasets.jl")

    export readdataset, listdatasets, plotdataset, listpgdatasets, listvirialdatasets

end
