function readMgc0811()

    lambda = Dict("u"    => 3600.0,
                  "g"    => 4800.0,
                  "r"    => 6300.0,
                  "i"    => 7700.0,
                  "z"    => 9100.0,
                  "A5100"=> 5100.0)

     # Read all content of file

     lcpath = dirname(pathof(GPCCData))

     allcontent = readdlm(lcpath * "/Data/Mgc0811/MGC0811_merged.txt")

     # Obtain distinct names of filters

     uniquefilternames = unique(allcontent[:, 1])

     # 2nd column are the days (need to convert into numerical values)

     days = map(Float64, allcontent[:, 2])

     # 3rd column are the fluxes

     fluxes = map(Float64, allcontent[:, 3])

     # 4th column is measurement error

     fluxerrors = map(Float64, allcontent[:, 4])

     # find out which indices belong to which filter

     filterindices = map(uniquefilternames) do fn

       findall(allcontent[:, 1] .== fn)

     end

     # DAYS
     # create an array of arrays with each i-th inner array holding the days
     # that belong to the i-th filter

     tobs = [days[idx] for idx in filterindices]

     # FLUXES
     # create an array of arrays with each i-th inner array holding the fluxes
     # that belong to the i-th filter

     yobs = [fluxes[idx] for idx in filterindices]

     # ERRORS
     # create an array of arrays with each i-th inner array holding the error measurements
     # that belong to the i-th filter

     σobs = [fluxerrors[idx] for idx in filterindices]

     @printf("Data are returned in order indicated by the filter names: " )
     map(x -> @printf("%s ",x), uniquefilternames); @printf("\n")

     # Make sure lambda are returned in order of uniquefilternames
     orderedlambda = [lambda[fn] for fn in uniquefilternames]

     return tobs, yobs, σobs, orderedlambda, minimum(minimum.(tobs))

end
