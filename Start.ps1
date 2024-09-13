# Install modules
Install-Module -Name PowerShellGet -Force -AllowClobber
Install-Module -Name MicrosoftTeams -Force -AllowClobber

# login to Microsoft
$credential = Get-Credential
Connect-MicrosoftTeams -Credential $credential

# Start execution of policy assignment scripts
$scriptDirectory = ".\"  # Update this path to your scripts directory

# Get all .ps1 files in the directory
$scripts = Get-ChildItem -Path $scriptDirectory -Filter *.ps1

# Loop through each script and execute it
foreach ($script in $scripts) {
    Write-Output "Running script: $($script.FullName)"
    & $script.FullName
}

Write-Output "All scripts executed successfully."