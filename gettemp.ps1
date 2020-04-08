function Get-Temperature {
    $t = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
    $returntemp = @()

    foreach ($temp in $t.CurrentTemperature)
    {


    $currentTempKelvin = $temp / 10
    $currentTempCelsius = $currentTempKelvin - 273.15

#    $currentTempFahrenheit = (9/5) * $currentTempCelsius + 32

#    $returntemp += $currentTempCelsius.ToString() + " C : " + $currentTempFahrenheit.ToString() + " F : " + $currentTempKelvin + "K"  
    $returntemp += $currentTempCelsius.ToString()  + " C"
    }
    return $returntemp
}
Get-Temperature
$temperature=Get-Temperature
$temperature=$env:computername + ": " + $temperature

Add-Content ws_temp.txt $temperature