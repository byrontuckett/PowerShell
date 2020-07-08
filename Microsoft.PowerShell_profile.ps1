<#
  Profile.  Mmmmmmmm, delicious!
#>

Write-Host " Loading the ole whack a mole..." -f Green

function Get-CompGroupMembership ($computer){
	return Get-ADComputer $computer | Get-ADPrincipalGroupMembership | select name | FL
}

function Get-UsersMembership($user){
	return Get-ADUser $user | Get-ADPrincipalGroupMembership | select name | FL
}

<# 
    Shortcut to find user in on prem AD
    Because I'm tired of writing Filter statements
    e.g. Find-ADUser *byron*
#>
function Find-ADUser([string]$user, [switch]$og){
	if($og){
		return Get-ADUser -Filter {SamAccountName -like $user } -properties DistinguishedName,Enabled,Name,SamAccountName,UserPrincipalName,LockedOut,PasswordLastSet,Title,LastLogonDate | Select  DistinguishedName,Enabled,Name,Title,SamAccountName,UserPrincipalName,LockedOut,PasswordLastSet,LastLogonDate |  Out-GridView -PassThru -Title "Select Users"
	}
	return Get-ADUser -Filter {SamAccountName -like $user } -properties DistinguishedName,Enabled,Name,SamAccountName,UserPrincipalName,LockedOut,PasswordLastSet,LastLogonDate
}
## Put it into a nice little alias
New-Alias -Name "fu" -Value Find-ADUser

<# 
    Shortcut to find groups.
    e.g. fg reall*stupidly*long*name*
#>
function Find-ADGroup([string]$group){
	if($og){
		return Get-ADGroup -Filter { Name -like $group } | Out-GridView -PassThru -Title "Select Group"
	}
	return Get-ADGroup -Filter { Name -like $group } 
}
## Put it into a nice little alias
New-Alias -Name "fg" -Value Find-ADGroup
