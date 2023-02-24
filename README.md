# Troodon-V2 Updated Config

This set of config files assumes that the firmware has been updated to at least 3.4.5.

# Changelog

## Version 1.1.1

* Fix typo in pause.g

## Version 1.1

* Add daemon.g file to control electronics bay fan depending on whether X/Y/Z are energised

## Version 1

* The coordinate system has been flipped so 0,0 is now in the front left rather than the back right. All files that use coordinates have been updated accordingly
* AutoZ.g has been updated to set the nozzle temperature to 175 degrees before probing in case of plastic on the nozzle
* Bed.g uses different dive height settings to speed up probing after first pass
* board.txt updated to use the built in pin definitions for the troodon v2
* config.g updated to use pin names rather than pin numbers
* config.g M572 moved to after the extruder is created
* config.g jerk speed and motor currents lowered
* config.g dual probing speeds set for toolhead probe
* config.g Q10 added for bed SSR
* config.g MCU temp added as a sensor
* config.g lights and electronics fan not set to start on boot
* config.g 12864 settings moved to screen.g
* config.g T0 added to end of config
* homeall.g set to use individual homing files
* homex.g and homey.g second pass homing speed reduced
* homez.g now moves to centre of bed to home
* nozzle-clean.g heats up hotend before cleaning
* pause.g retraction increased from 0.5 to 2mm and tool moves to front centre of the machine
* resume.g priming of nozzle increased from 0.5 to 2mm