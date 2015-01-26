Param(
    [Parameter(Mandatory=$True)]
    [string[]]
    $Group
)

Import-Module GroupPolicy

$WUKey = "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate"

$GPO = New-GPO -name ("New - WSUS Group - " + $Group[0]) -ErrorAction Stop

$GPO | Set-GPRegistryValue -Key $WUKey -ValueName "TargetGroupEnabled" -Type DWord  -Value 1
$GPO | Set-GPRegistryValue -Key $WUKey -ValueName "TargetGroup"        -Type String -value ($Group -join "; ")
