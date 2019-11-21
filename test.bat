@ECHO OFF
FOR /F "tokens=* USEBACKQ" %%F IN (`where /r "c:\Program Files (x86)" ospp.vbs`) DO (
SET var=%%F
)
ECHO %var%
cscript "%var%" /dstatus
