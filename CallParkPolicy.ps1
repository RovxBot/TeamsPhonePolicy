# create new Call Park policy
New-CsTeamsCallParkPolicy -Identity "CALLPARKPOLICYNAME" `
-Description "CALLPOLICYDESCRIPTION" `
-AllowCallPark $true `
#start and end range for park number
-PickupRangeStart 500 
-PickupRangeEnd 1500 
-ParkTimeoutSeconds 600 #Ring back the parker after 600 secoonds if the call is not picked up