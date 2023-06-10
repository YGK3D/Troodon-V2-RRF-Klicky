if sensors.filamentMonitors[0].status!="ok"
    abort "Filament sensor shows no filament loaded.  Print aborted"
M98 P"/macros/Klicky/zprobe/clicky_status.g"