 ; ---------- ---------- Auto Z ---------- ----------
 
 ; to use autoz, please place the following near the end of your slicers start gcode
 ; M98 P"/macros/autoz/autoz.g" <<< Place in slicer


; ---------- prepare ----------


M98 P"/macros/Klicky AutoZ/scripts/defaults.g" ; load some defaults which will be overwriten by the "edit_me.g"
M98 P"klicky-autoZ-config.g" ; load your settings
M98 P"/macros/Klicky AutoZ/scripts/autoz_globals.g" ; load autoz framework
G29 S2 ; disable mesh
M290 R0 S0 ; RESET BABY STEPPING


; ---------- probe the nozzle ----------


M98 P"/macros/Klicky AutoZ/scripts/autozhop_up.g" ; large z hop incase the nozzle is low and you have a high pin
M400
M98 P"/macros/Klicky AutoZ/scripts/use_pin_autoz.g" ; use the z pin
M400
M98 P"/macros/Klicky AutoZ/scripts/pin_xy.g" ; go to the z pin
M400
M98 P"/macros/Klicky AutoZ/scripts/drive_autoz.g" ; set z drive safe physics

G30 ; zero the z axis to the nozzle

M400
M98 P"/macros/Klicky AutoZ/scripts/restore_zdrive.g" ; restore the z drive to the state before autoz
M400
M98 P"/macros/Klicky AutoZ/scripts/smallzhopup.g" ; move up 2mm
M400


; ---------- load the clicky ----------


M98 P"/macros/Klicky AutoZ/scripts/use_clicky_autoz.g" ; use the clicky probe 
M400
M98 P"/macros/Klicky AutoZ/scripts/autozhop_up.g"
M400
M98 P"/macros/Klicky AutoZ/scripts/clicky_status.g"
M400
M98 P"/macros/Klicky AutoZ/scripts/loadclicky.g" ; pick up and verify clicky
M400
M98 P"/macros/Klicky AutoZ/scripts/clicky_status.g"

M400
M98 P"/macros/Klicky AutoZ/scripts/confirmclicky.g"

M400
M98 P"/macros/Klicky AutoZ/scripts/pin_xy_clicky.g" ; move the clicky probe switch body over the z pin
M400
M98 P"/macros/Klicky AutoZ/scripts/use_pin_autoz.g" ; use the z pin
M400
M98 P"/macros/Klicky AutoZ/scripts/drive_autoz.g" ; set z drive safe physics
M400


; ---------- probe clicky switch body ----------


M98 P"/macros/Klicky AutoZ/scripts/probeclicky.g" ; probe the clicky body with the z pin
M400
M98 P"/macros/Klicky AutoZ/scripts/calculate.g" ; simple z offset calculation and average
M400
M98 P"/macros/Klicky AutoZ/scripts/comptomesh.g"
M98 P"/macros/Klicky AutoZ/scripts/use_clicky_autoz.g" ; use the clicky probe
M98 P"/macros/Klicky AutoZ/scripts/autozhop_up.g" ; hop to clear the switch
M400
M98 P"/macros/Klicky AutoZ/scripts/bedcenter.g" ; go to the center of the bed 
M400

G30 ; set Z0 according to the clicky


; ---------- get final result ----------


M400
M98 P"/macros/Klicky AutoZ/scripts/finaloffset.g"


; ---------- finish up ----------


M291 T5 R"AutoZ complete" P"Z offset was detected"
M98 P"/macros/Klicky AutoZ/scripts/restore_zdrive.g" ; restore the z drive to the state before autoz
M98 P"/macros/Klicky AutoZ/scripts/autozhop_up.g" ; small z hop
M400
M98 P"/macros/Klicky AutoZ/scripts/unloadclicky.g" ; unload the clicky probe
M98 P"/macros/Klicky AutoZ/scripts/bedcenter.g" ; go to the center of the bed 
;M98 P"/macros/Klicky AutoZ/scripts/alldone.g" ; do a happy dance

G31 K0 Z{global.autoz}
M500 P31
