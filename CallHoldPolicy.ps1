#File upload
$content = [System.IO.File]::ReadAllBytes('.\AudioFiles\media.wav')
$audioFile = Import-CsOnlineAudioFile -ApplicationId TenantGlobal -FileName "Hello.wav" -Content $content

#Create new Call Hold policy
New-CsTeamsCallHoldPolicy -Identity "CALLPOLICYNAME" `
-Description "CALLPOLICYDESCRIPTION" `
-AudioFileID $audioFile