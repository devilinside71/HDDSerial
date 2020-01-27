@Echo off&SetLocal EnableExtensions EnableDelayedExpansion
Set "WinVerAct="

For /f "tokens=*" %%W in ('
    cscript /Nologo "C:\Windows\System32\slmgr.vbs" /xpr
') Do Set "WinVerAct=!WinVerAct! %%W"
if Not defined WinVerAct ( 
    Echo:No response from slmgr.vbs
    Exit /B 1
)
Echo Windows Version Activation Status:
Echo:"%WinVerAct:~1%"