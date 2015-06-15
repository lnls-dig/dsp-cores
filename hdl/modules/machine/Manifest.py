# TODO: if hdlmake allowed for importing python packages in inner modules, this could existing directories directly

if (machine_pkg == "uvx_130M"):
    modules = { "local" : "uvx_130M"}
elif (machine_pkg == "sirius_130M"):
    modules = { "local" : "sirius_130M"}
else:
    quit("Invalid machine module! Check machine_pkg variable!")
