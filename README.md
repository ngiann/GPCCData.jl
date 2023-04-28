<h1 align="center">GPCCData.jl</h1>

## ℹ What is this?

It is a julia package that allows convenient access to certain datasets.


## 💾 Installation 

This package is registered with [AINJuliaRegistry](https://github.com/HITS-AIN/AINJuliaRegistry).
Please add `AINJuliaRegistry` in order to use package.
Install with `add GPCCData` in package mode once `AINJuliaRegistry` has been added to your Julia installation.

## ▶ Available datasets

3C120, Mrk335, Mrk1501, Mrk6, PG2130099, Mgc0811, ESO399-IG20

## ▶ Available functions

The package exports three functions called `listdatasets`, `readdataset`, `plotdataset`.

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

