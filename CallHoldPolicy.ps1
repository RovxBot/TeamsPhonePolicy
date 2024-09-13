# Install modules
Install-Module -Name PowerShellGet -Force -AllowClobber
Install-Module -Name MicrosoftTeams -Force -AllowClobber

# login to Microsoft
$credential = Get-Credential
Connect-MicrosoftTeams -Credential $credential

#File upload
$content = [System.IO.File]::ReadAllBytes('.\AudioFiles\media.wav')
$audioFile = Import-CsOnlineAudioFile -ApplicationId TenantGlobal -FileName "Hello.wav" -Content $content

#Create new Call Hold policy
New-CsTeamsCallHoldPolicy -Identity "CALLPOLICYNAME" `
-Description "CALLPOLICYDESCRIPTION" `
-AudioFileID $audioFile