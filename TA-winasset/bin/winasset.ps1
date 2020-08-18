# Get IP
$ip = Test-Connection -ComputerName (hostname) -Count 1 | select -ExpandProperty IPV4ADDRESS

# GEt nt_host
$nt_host = hostname

# Get DNS
$dns = ([System.Net.Dns]::GetHostByName(($env:computerName))).Hostname

#Get Mac
$strMac = Get-NetAdapter | Format-List -Property MacAddress | findstr "MacAddress" | Select-Object -index 0
$mac = $strMac[13..($strMac.Length-1)] -join ''

# Get Priority
$priority="unknown"

# Lat/long
$lat="unkown"
$long="unknown"

#City
$owner = "unknown"
$city = "unknown"
$country = "unknown"
$bunit = "unknown"
$category = "unknown"
$pci_domain = "untrust"
$is_expected = "unknown"
$should_timesync = "True"
$should_update = "True"
$requires_av = "True"

# Return Values to Splunk
write-host ip=$ip,mac=$mac,nt_host=$nt_host,dns=$dns,owner=$owner,priority=$priority,lat=$lat,long=$long,city=$city,country=$country,bunit=$bunit,category=$category,pci_domain=$pci_domain,is_expected=$is_expected,should_timesync=$should_timesync,should_update=$should_update,requires_av=$requires_av