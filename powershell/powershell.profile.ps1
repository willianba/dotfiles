# Config for oh-my-posh
Import-Module posh-git
Import-Module oh-my-posh
Import-Module Terminal-Icons
Set-PoshPrompt Sorin

# Aliases
function k([Parameter(ValueFromRemainingArguments = $true)]$params) { & kubectl $params }

# Color Schema
# Set-PSReadLineOption -Colors @{ "Operator"="#6f00ff"; "Parameter"="#6f00ff" }
