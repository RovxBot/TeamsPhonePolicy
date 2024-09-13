# Install modules
Install-Module -Name PowerShellGet -Force -AllowClobber
Install-Module -Name MicrosoftTeams -Force -AllowClobber

# login to Microsoft
$credential = Get-Credential
Connect-MicrosoftTeams -Credential $credential

# Grab recource accounts as required
$AccountID =  (Get-CsOnlineApplicationInstance -Identity account@contoso.com).ObjectId

# New Caller ID policy
New-CsCallingLineIdentity
-Identity "CALLERIDNAME" `
-Description "CALLERIDDESCRIPTION" `
-BlockIncomingPstnCallerID $false `
-EnableUserOverride $false `

# If using a useraccount as the caller ID
-CallingIDSubstitute Resource `
-ResourceAccount $ObjId `
-CompanyName "Contoso"


