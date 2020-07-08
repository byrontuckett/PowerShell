<#
    Prints the Host for the given VM.
    Quick n Dirty
    @todo: extend to a allow an array of vms
#>
[CmdletBinding()]
param (
    # Specifies a path to one or more locations.
    [Parameter(Mandatory=$true,
               Position=0,
               ValueFromPipeline=$true,
               ValueFromPipelineByPropertyName=$true,
               HelpMessage="The Virtual machine FQDN or hostname")]
    [ValidateNotNullOrEmpty()]
    [string]
    $vm 
)
    
begin {
}
    
process {

    $block = {
        (get-item "HKLM:\SOFTWARE\Microsoft\Virtual Machine\Guest\Parameters").GetValue("HostName")
            
    }
    Invoke-Command  $vm  $block
}
    
end {
}
