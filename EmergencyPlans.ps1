# Install modules
Install-Module -Name PowerShellGet -Force -AllowClobber
Install-Module -Name MicrosoftTeams -Force -AllowClobber

# login to Microsoft
$credential = Get-Credential
Connect-MicrosoftTeams -Credential $credential

# create new Emergency number
$en1 =  New-CsTeamsEmergencyNumber -EmergencyDialString "000" -EmergencyDialMask "933" -OnlinePSTNUsage "AUSE000"

# create new Emergency Call Routing Policy
New-CsTeamsEmergencyCallRoutingPolicy
-Identity "EMERGENCYCALLROUTINGPOLICYNAME" `
-Description "EMERGENCYCALLROUTINGPOLICYDESCRIPTION" `
-EmergencyNumbers @{add=$en1}
-AllowEnhancedEmergencyServices:$true `
