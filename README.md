<h1 align="center">GPCCData.jl</h1>

## ℹ What is this?

It is a julia package that allows convenient access to certain datasets.


## 💾 Installation 

This package is registered with [AINJuliaRegistry](https://github.com/HITS-AIN/AINJuliaRegistry).
Please add `AINJuliaRegistry` in order to use package.
Install with `add GPCCData` in package mode once `AINJuliaRegistry` has been added to your Julia installation.

## ▶ Available datasets

3C120, Mrk335, Mrk1501, Mrk6, PG2130099, pg0026, pg0052, pg0804, pg0844, pg0953, pg1211, pg1226, pg1229, pg1307, pg1351, pg1411, pg1426, pg1613, pg1617, pg1700, pg1704, pg2130, NGC5548

## ▶ Available functions

The package exports three functions called `listdatasets`, `listvirialdatasets`, `listpgdatasets`, `readdataset`, `plotdataset`.

## ▶ Examples

See a brief description in "help mode" with e.g. ?readdataset.

```
using GPCCData
using PyPlot # must be independently installed

days, flux, stdflux, bandfilenames, minimumtime = readdataset(source="Mrk6")

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

