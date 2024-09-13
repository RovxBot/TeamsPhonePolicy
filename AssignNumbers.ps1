# Path to the CSV file
$csvPath = ".\Excel\Userlist.csv"

# Import the CSV file
$users = Import-Csv -Path $csvPath

# Loop through each user and assign the phone number
foreach ($user in $users) {
    $upn = $user.UPN
    $phoneNumber = $user.PhoneNumber

    # Assign the phone number in Teams
    Set-CsPhoneNumberAssignment -Identity $upn -PhoneNumber $phoneNumber -PhoneNumberType CallingPlan
}

Write-Output "Phone numbers assigned successfully."