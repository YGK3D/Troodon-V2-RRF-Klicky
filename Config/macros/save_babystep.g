;save_babystep.g
; Add babystep to Z offset and make "persistant"

if move.axes[2].babystep !=0
	echo {"Z trigger height altered by " ^ move.axes[2].babystep ^  "mm"}
	echo {"Probe - OLD: " ^ sensors.probes[0].triggerHeight ^ " new: " ^ sensors.probes[0].triggerHeight - move.axes[2].babystep}
	;echo {"AutoZ - OLD: " ^ sensors.probes[1].triggerHeight ^ " new: " ^ sensors.probes[1].triggerHeight - move.axes[2].babystep}
	G31 K0 Z{sensors.probes[0].triggerHeight - move.axes[2].babystep}
	M500 P31                                                                 ; save settings to config-overide.g - Must have M501 in config.g
	if state.status != "processing"
		M290 R0 S0 ; clear babystepping
else
	echo "No babystepping set.  Nothing to save"