<h1 align="center">GPCC.jl</h1>


## 💾 Installation 

This package is registered with [AINJuliaRegistry](https://github.com/HITS-AIN/AINJuliaRegistry).
Please add `AINJuliaRegistry` in order to use package.
Install with `add GPCCData` in package mode once `AINJuliaRegistry` has been added to your Julia installation.

## ▶ Available datasets with reported delays in literature

|object   |  delay |  edelay |
| ---     |  ---   |   ---   | 
Mrk335	  |  14.0  |   0.9	 |
Mrk1501   |  13.8  |   5.4   |
3C120     |  25.6  |   2.4   | 
Mrk6      |  10.2  |   1.2   |  
PG2130099 |   9.7  |   1.3   |   


(new data have not been added to table above)

## ▶ Available functions

The package exports three functions called `listdatasets`, `readdataset` and `plotdataset`.

## ▶ Examples

See a brief description in "help mode" with e.g. ?readdataset.

```
using GPCCData
using PyPlot # must be independently installed

days, flux, stdflux, bandfilenames = readdataset(source="Mrk6")

figure(1) ; cla()

for i in 1:length(days)
  errorbar(days[i], flux[i], yerr=stdflux[i], fmt="o", label=bandfilenames[i])
end

legend()
```

Alternatively, one can conveniently plot a dataset using e.g. `plotdataset(source = "Mrk6")`.

To get a  list of the available datasets call `listdatasets()`.

Example: plot all available datasets:
```
map(source -> plotdataset(source = source), listdatasets())
```

