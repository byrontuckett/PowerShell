
<# Display information about mailboxes which have Litigation Hold | information about the recoverable items folder. #>
Get-Mailbox -ResultSize Unlimited -Filter {LitigationHoldEnabled -eq $true} `
    | Get-MailboxFolderStatistics –FolderScope RecoverableItems `
    | Format-Table Identity,FolderAndSubfolderSize -Auto

<# Get mailboxes that don't have litigation enabled#>
Get-Mailbox | Where {$_.LitigationHoldEnabled -match "False"} | FL Name,LitigationHold*

# Display information about User mailboxes which has Litigation Hold using the Where operator
Get-Mailbox | Where {$_.LitigationHoldEnabled -match "True"} | FL Name,LitigationHold*

# Info about single user.
Get-Mailbox John | FL LitigationHold*

# Display information about all of the mailboxes which have Litigation Hold
Get-Mailbox -ResultSize Unlimited | FL LitigationHold*

# Display information about User mailboxes which has Litigation Hold using the filter operator
Get-Mailbox -ResultSize Unlimited -Filter {RecipientTypeDetails -eq "UserMailbox"} | FL Name,LitigationHold*
