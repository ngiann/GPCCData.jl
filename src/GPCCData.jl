module GPCCData

    using DelimitedFiles, Printf, JLD2, PyPlot

    include("readdatasets.jl")

    include("listdatasets.jl")

    include("plotdataset.jl")

    include("readvirialdatasets.jl")

    include("readpgdatasets.jl")

    include("readNGC5548datasetdatasets.jl")

    include("Data/Mgc0811/readMgc0811.jl")

    include("Data/ESO399-IG20/readESO399_IG20.jl")

    export readdataset, listdatasets, plotdataset, listpgdatasets, listvirialdatasets

end
