# Install modules
Install-Module -Name PowerShellGet -Force -AllowClobber
Install-Module -Name MicrosoftTeams -Force -AllowClobber

# login to Microsoft
$credential = Get-Credential
Connect-MicrosoftTeams -Credential $credential


# Create new Online Voicemail policy
New-CsOnlineVoicemailPolicy -Identity "VoicemailPolicy" `
-MaximumRecordingLength ([TimeSpan]::FromSeconds(60))
# Other settings left as global value

# Preamble and Postamble audio upload
$preamble = [System.IO.File]::ReadAllBytes('.\AudioFiles\preamble.wav')
$postamble = [System.IO.File]::ReadAllBytes('.\AudioFiles\postamble.wav')
$PostambleAudioFile = Import-CsOnlineAudioFile -ApplicationId TenantGlobal -FileName "preamble.wav" -Content $content
$PreambleAudioFile = Import-CsOnlineAudioFile -ApplicationId TenantGlobal -FileName "postamble.wav" -Content $content

# Add audio files to voicemail policy
-PreambleAudioFileID $PreambleAudioFile
-PostambleAudioFileID $PostambleAudioFile

