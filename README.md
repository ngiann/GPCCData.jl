# GPCCData

This package is registered with [AINJuliaRegistry](https://github.com/HITS-AIN/AINJuliaRegistry).
Please add `AINJuliaRegistry` in order to use package.
Install with `add GPCCVirialDatasets` in package mode once `AINJuliaRegistry` has been added to your Julia installation.

## Available datasets

|object   |  delay |  edelay |
| ---     |  ---   |   ---   | 
Mrk335	  |  14.0  |   0.9	 |
Mrk1501   |  13.8  |   5.4   |
3C120     |  25.6  |   2.4   | 
Mrk6      |  10.2  |   1.2   |  
PG2130099 |   9.7  |   1.3   |   

---

## Available functions

The package exports three functions called listdatasets, readdataset and plotdataset.

## Examples

See a brief description in "help mode" with e.g. ?readdataset.

```
using GPCCData
using PyPlot # must be independently installed

days, flux, stdflux, vel = readdataset(source="Mrk6")

for i in 1:length(days)
  figure(i) ; cla()
  errorbar(days[i], flux[i], yerr=stdflux[i], fmt="o")
end
```

Alternatively, can conveniently plot a dataset using e.g. `plotdataset(source = "Mrk6")`.

To get a  list of the available datasets call `listdatasets()`.

Example: plot all available datasets:
```
map(source -> plotdataset(source = source), listdatasets())
```

