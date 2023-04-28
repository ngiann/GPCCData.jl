"""
    listdatasets()
    Returns all available datasets as an array of strings.
"""
function listdatasets()

  vcat(listvirialdatasets(), "Mgc0811", "ESO399-IG20")

end


"""
    listvirialdatasets()
    Returns virial datasets as an array of strings.
"""
function listvirialdatasets()

    ["3C120", "Mrk335", "Mrk1501", "Mrk6", "PG2130099"]

end
