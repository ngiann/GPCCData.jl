"""
    days, flux, stdflux = readdataset(; source = source)

    Load observed data.

"""
function readdataset(;source=source)

    if source in ["3C120", "Mrk335", "Mrk1501", "Mrk6", "PG2130099"]

        return readvirialdataset(source = source)

    elseif source in ["pg0026", "pg0052", "pg0804", "pg0844", "pg0953", "pg1211", "pg1226", "pg1229", "pg1307", "pg1351", "pg1411", "pg1426", "pg1613", "pg1617", "pg1700", "pg1704", "pg2130"]

        return readpgdataset(source = source)

    else

        @printf("Argument source must be one of the following:\n")

        map(x->@printf("%s\n",x), listdatasets())

        error(@sprintf("%s unknown source!", source))

    end

end
