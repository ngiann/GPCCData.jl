"""
    listdatasets()
    Returns all available datasets as an array of strings.
"""
function listdatasets()

  vcat(listvirialdatasets(), listpgdatasets(), "NGC5548", "Mgc0811")

end


"""
    listpgdatasets()
    Returns PG datasets as an array of strings.
"""
function listpgdatasets()

    ["pg0026", "pg0052", "pg0804", "pg0844",
     "pg0953", "pg1211", "pg1226", "pg1229",
     "pg1307", "pg1351", "pg1411", "pg1426",
     "pg1613", "pg1617", "pg1700", "pg1704", "pg2130"]

end


"""
    listvirialdatasets()
    Returns virial datasets as an array of strings.
"""
function listvirialdatasets()

    ["3C120", "Mrk335", "Mrk1501", "Mrk6", "PG2130099"]

end
