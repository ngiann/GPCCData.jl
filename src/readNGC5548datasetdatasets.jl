"""
    days, flux, stdflux, bandfilename, minimumtime = readNGC5548dataset(; source = source)

    Load observed NGC5548 data.

"""
function readNGC5548dataset(;source=source)

    @printf("Loading data for source %s\n", source)

    lcpath = joinpath(dirname(pathof(GPCCData)), "Data/Peterson/")

    orderedfilenames = [lcpath * source * "_conti.txt",
                        lcpath * source * "_hbeta.txt"]

    existingfilenames = filter(isfile, orderedfilenames)


    # collect all times in order to find minimum
    alltimes = map(existingfilenames) do file

        @printf("\t reading file %s\n", file)

        readdlm(file)[:, 1]

    end

    minMJD = minimum(minimum.(alltimes))

    @printf("\t Minimum time is %f\n", minMJD)

    aux = map(existingfilenames) do file

        @printf("\t reading file %s\n", file)

        local data = readdlm(file)[:, 1:3]

        local time, flux, stdflux = data[:,1], data[:,2], data[:,3]

        local time₀ = time .- minMJD

        time₀, flux, stdflux

    end

    # re-organise data in aux

    L = length(aux)  # number of bands

    @assert(L == length(existingfilenames)) # sanity check

    time    = [a[1] for a in aux]
    flux    = [a[2] for a in aux]
    stdflux = [a[3] for a in aux]

    return time, flux, stdflux, existingfilenames, minMJD

end
