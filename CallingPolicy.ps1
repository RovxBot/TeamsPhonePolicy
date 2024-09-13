# Install modules
Install-Module -Name PowerShellGet -Force -AllowClobber
Install-Module -Name MicrosoftTeams -Force -AllowClobber

# login to Microsoft
$credential = Get-Credential
Connect-MicrosoftTeams -Credential $credential

#Create new Calling policy
New-CsTeamsCallingPolicy -Identity "CALLPOLICYNAME" `
-Description "CALLPOLICYDESCRIPTION" `
-AllowPrivateCalling $True `
-AllowCloudRecordingForCalls $False `
-AllowTranscriptionForCalling $False `
-InboundPstnCallRoutingTreatment $RegularIncoming, $Unanswered, $Voicemail, $UserOverride
-InboundFederatedCallRoutingTreatment $RegularIncoming, $Unanswered, $Voicemail, $UserOverride
-AllowCallForwardingToPhone $True `
-AllowCallForwardingToUser $True `
-AllowVoicemail $AlwaysEnabled, $AlwaysDisabled, $UserOverride
-AllowCallGroups $True `
-AllowDelegation $True `
-PreventTollBypass $False `
-MusicOnHoldEnabledType $True `
-BusyOnBusyEnabledType $Enabled, $Disabled, $UserOverride
-AllowWebPSTNCalling $True `
-LiveCaptionsEnabledTypeForCalling $True `
-AutoAnswerEnabledType $False `
-SpamFilteringEnabledType $Enabled, $Disabled, $EnabledWithoutIVR
-AllowSIPDevicesCalling $False `
-PopoutForIncomingPstnCalls $False