# Install modules
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module -Name Terminal-Icons -Repository PSGallery

# Copy profile file - Adapt to match Documents folder
Copy-Item .\powershell.profile.ps1 ~\Documents\Powershell\Microsoft.PowerShell_profile.ps1