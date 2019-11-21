@echo off
wmic diskdrive get Name, Manufacturer, Model, InterfaceType, MediaType, SerialNumber /format:csv | find "PHYSICAL" >> whddlist.txt
wmic nicconfig get Description, MACAddress /format:csv | find ":" >> wniclist.txt
wmic bios get Name, Manufacturer, SerialNumber /format:csv | find "Ver" >> wbioslist.txt
wmic OS LIST BRIEF /format:csv  | find "WINDOWS" >> woslist.txt
FOR /F "tokens=* USEBACKQ" %%F IN (`where /r "c:\Program Files" ospp.vbs`) DO (
SET ospppath=%%F
)
FOR /F "tokens=* USEBACKQ" %%F IN (`where /r "c:\Program Files (x86)" ospp.vbs`) DO (
SET ospppath2=%%F
)
wmic bios get Name, Manufacturer, SerialNumber /format:csv | find "Ver" >> wofficelist.txt
echo Office 64 bit: >> wofficelist.txt
cscript "%ospppath%" /dstatus | findstr "PRODUCT LICENSE key:" >> wofficelist.txt
echo Office 32 bit: >> wofficelist.txt
cscript "%ospppath2%" /dstatus | findstr "PRODUCT LICENSE key:" >> wofficelist.txt
echo ---------------------------------------------------- >> wofficelist.txt
wmic bios get Name, Manufacturer, SerialNumber /format:csv | find "Ver"
echo FINISHED