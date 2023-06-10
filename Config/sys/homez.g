if !move.axes[0].homed || !move.axes[1].homed	        ; If the printer hasn't been homed, home it
	G28 XY	                                            ; home y and x
M98 P"/macros/Klicky/zprobe/clicky_status.g"
if global.clicky_status = "docked"
	M98 P"/macros/Klicky/zprobe/loadclicky.g"
G91                                                     ; relative positioning
G1 H2 Z10 F6000                                         ; lift Z relative to current position
G90                                                     ; absolute positioning
G1 X{(move.axes[0].min + move.axes[0].max)/2 - sensors.probes[0].offsets[0]} Y{(move.axes[1].min + move.axes[1].max)/2 - sensors.probes[0].offsets[1]} F3600    ; Move to the centre of the bed taking the zprobe offsets into account
M558 K0 H5                                             ; Set the dive height for the probe to 5mm
G30                                                     ; probe the bed
;G92 Z13													; override z coordinate
M98 P"/macros/Klicky/zprobe/unloadclicky.g"