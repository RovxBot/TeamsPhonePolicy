# Install modules
Install-Module -Name PowerShellGet -Force -AllowClobber
Install-Module -Name MicrosoftTeams -Force -AllowClobber

# login to Microsoft
$credential = Get-Credential
Connect-MicrosoftTeams -Credential $credential

# create new Call Park policy
New-CsTeamsCallParkPolicy -Identity "CALLPOLICYNAME" `
-Description "CALLPOLICYDESCRIPTION" `
-AllowCallPark $true `
#start and end range for park number
-PickupRangeStart 500 
-PickupRangeEnd 1500 
-ParkTimeoutSeconds 600 #Ring back the parker after 600 secoonds if the call is not picked up