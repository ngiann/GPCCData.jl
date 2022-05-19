"""
    days, flux, stdflux, bandfilename = readvirialdataset(; source = source)

    Load observed data.

"""
function readvirialdataset(;source=source)

    if source=="3C120"
        z = 0.0330
        V = 1514.0
    elseif source=="Mrk335"
        z = 0.0258
        V = 1293.0
    elseif source=="Mrk1501"
        z = 0.0893
        V = 3321.0
    elseif source=="Mrk6"
        z = 0.0188
        V = 3714.0
    elseif source=="PG2130099"
        z = 0.0630
        V = 1825.0
    else
        @printf("Argument source must be one of the following:\n")
        map(x->@printf("%s\n",x), listdatasets())
        error("unknown source!")
    end

    lcpath = joinpath(dirname(pathof(GPCCData)), "Data/Virial/")#"src/Data/"
    dtabC =  lcpath * source * "Conti.txt"
    dtabL =  lcpath * source * "Hbeta.txt"



    @printf("\t Loading data for source %s\n", source)

    Conti = readdlm(dtabC)[:, 1:3]
    Line  = readdlm(dtabL)[:, 1:3]

    daysC = Conti[:,1]
    flxC  = Conti[:,2]
    eflxC = Conti[:,3]

    daysL = Line[:,1]
    flxL  = Line[:,2]
    eflxL = Line[:,3]

    daysT = [minimum(daysC),minimum(daysL)]
    minMJD = minimum(daysT)

    daysCmod = daysC .- minMJD
    daysLmod = daysL .- minMJD

    #bring data to rest-frame
    daysCmod = daysCmod./(z+1)
    daysLmod = daysLmod./(z+1)

    days = [daysCmod,daysLmod]
    flx  = [flxC,flxL]
    eflx = [eflxC,eflxL]

    return days, flx, eflx, [source * "Conti.txt", source * "Hbeta.txt"]


end
