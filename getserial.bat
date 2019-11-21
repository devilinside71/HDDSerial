@echo off
SET TIMESTAMP=%date% %time%
wmic diskdrive get Name, Manufacturer, Model, InterfaceType, MediaType, SerialNumber /format:csv | find "PHYSICAL" >> whddlist.txt
wmic nicconfig get Description, MACAddress /format:csv | find ":" >> wniclist.txt
wmic bios get Name, Manufacturer, SerialNumber /format:csv | find "Ver" >> wbioslist.txt
wmic OS LIST BRIEF /format:csv  | find "WINDOWS" >> woslist.txt
FOR /F "tokens=* USEBACKQ" %%F IN (`where /r "c:\Program Files" ospp.vbs`) DO (
SET ospppath64=%%F
)
FOR /F "tokens=* USEBACKQ" %%F IN (`where /r "c:\Program Files (x86)" ospp.vbs`) DO (
SET ospppath32=%%F
)
echo %TIMESTAMP% >> wofficelist.txt
wmic bios get Name, Manufacturer, SerialNumber /format:csv | find "Ver" >> wofficelist.txt
echo Office 64 bit: >> wofficelist.txt
cscript "%ospppath64%" /dstatus | findstr "PRODUCT LICENSE key:" >> wofficelist.txt
echo Office 32 bit: >> wofficelist.txt
cscript "%ospppath32%" /dstatus | findstr "PRODUCT LICENSE key:" >> wofficelist.txt
echo ---------------------------------------------------- >> wofficelist.txt
echo %TIMESTAMP% >> wfulllist.txt
echo BIOS >> wfulllist.txt
wmic bios get Name, Manufacturer, SerialNumber /format:csv | find "Ver" >> wfulllist.txt
echo ------------------------------------------------------------------------------------------ >> wfulllist.txt
echo DISK >> wfulllist.txt
wmic diskdrive get Name, Manufacturer, Model, InterfaceType, MediaType, SerialNumber /format:csv | find "PHYSICAL" >> wfulllist.txt
echo ------------------------------------------------------------------------------------------ >> wfulllist.txt
echo NETWORK >> wfulllist.txt
wmic nicconfig get Description, MACAddress /format:csv | find ":" >> wfulllist.txt
echo ------------------------------------------------------------------------------------------ >> wfulllist.txt
echo OS >> wfulllist.txt
wmic OS LIST BRIEF /format:csv  | find "WINDOWS" >> wfulllist.txt
echo ------------------------------------------------------------------------------------------ >> wfulllist.txt
echo Office 64 bit: >> wfulllist.txt
cscript "%ospppath64%" /dstatus | findstr "PRODUCT LICENSE key:" >> wfulllist.txt
echo ------------------------------------------------------------------------------------------ >> wfulllist.txt
echo Office 32 bit: >> wfulllist.txt
cscript "%ospppath32%" /dstatus | findstr "PRODUCT LICENSE key:" >> wfulllist.txt
echo ****************************************************************************************** >> wfulllist.txt

wmic bios get Name, Manufacturer, SerialNumber /format:csv | find "Ver"
echo FINISHED