"""
    days, flux, stdflux, band_description, minimumtime = readdataset(; source = source)

    Load observed data.

"""
function readdataset(;source=source)

    if source in ["3C120", "Mrk335", "Mrk1501", "Mrk6", "PG2130099"]

        return readvirialdataset(source = source)

    elseif source in ["Mgc0811"]

        return readMgc0811()

    elseif source in ["ESO399-IG20", "ESO399_IG20"]

        return readESO399_IG20()

    else

        @printf("Argument source must be one of the following:\n")

        map(x->@printf("%s\n",x), listdatasets())

        error(@sprintf("%s unknown source!", source))

    end

end
