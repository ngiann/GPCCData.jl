function readESO399_IG20()

    lcpath = dirname(pathof(GPCCData)) * "/Data/ESO399-IG20/"

    tblue, yblue, σblue = readdlm(lcpath*"B.dat")[:,1], readdlm(lcpath*"B.dat")[:,2], readdlm(lcpath*"B.dat")[:,3]

    tred,  yred,  σred  = readdlm(lcpath*"Halpha.dat")[:,1], readdlm(lcpath*"Halpha.dat")[:,2], readdlm(lcpath*"Halpha.dat")[:,3]

    tobs = [tblue, tred]
    yobs = [yblue, yred]
    σobs = [σblue, σred]
    
    return tobs, yobs, σobs, ["B.dat", "Halpha.dat"], minimum(minimum.(tobs))

end
