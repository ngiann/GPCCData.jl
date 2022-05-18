"""
    days, flux, stdflux, vel = readdataset(; source = source)

    Load observed data.

"""
function readpgdataset(;source=source)


    lcpath = joinpath(dirname(pathof(GPCCData)), "Data/PGData/")#"src/Data/"
    filecon =  lcpath * source * "_con"
    fileHa  =  lcpath * source * "_ha"
    fileHb  =  lcpath * source * "_hb"
    fileHg  =  lcpath * source * "_hg"

    @printf("\t Loading data for source %s\n", source)

    datacon = readdlm(filecon)[:, 1:3]
    dataha  = readdlm(fileHa)[:, 1:3]
    datahb  = readdlm(fileHb)[:, 1:3]
    datahg  = readdlm(fileHg)[:, 1:3]

    daysCON = datacon[:,1]
    flxCON  = datacon[:,2]
    eflxCON = datacon[:,3]

    daysHA = dataha[:,1]
    flxHA  = dataha[:,2]
    eflxHA = dataha[:,3]

    daysHB = datahb[:,1]
    flxHB  = datahb[:,2]
    eflxHB = datahb[:,3]

    daysHG = datahg[:,1]
    flxHG  = datahg[:,2]
    eflxHG = datahg[:,3]

    minMJD  = minimum([minimum(daysCON),minimum(daysHA),minimum(daysHB),minimum(daysHG)])

    daysCONmod = daysCON .- minMJD
    daysHAmod  = daysHA  .- minMJD
    daysHBmod  = daysHB  .- minMJD
    daysHGmod  = daysHG  .- minMJD

    # #bring data to rest-frame
    # daysCONmod = daysCONmod./(z+1)
    # daysHAmod = daysHAmod./(z+1)

    days = [daysCONmod, daysHAmod, daysHBmod, daysHGmod]
    flx  = [flxCON, flxHA, flxHB, flxHG]
    eflx = [eflxCON, eflxHA, eflxHB, eflxHG]

    return days, flx, eflx


end
