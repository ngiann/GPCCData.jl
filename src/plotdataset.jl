"""
    plotdataset(; source = source)

    Plot observed data.

"""
function plotdataset(; source = source)

  days, flux, stdflux, bandfilename, = readdataset(source = source)

  figure()

  for i in 1:length(days)

    errorbar(days[i], flux[i], yerr=stdflux[i], fmt="o", label=bandfilename[i])

  end

  legend()

  title(source)

  nothing

end
