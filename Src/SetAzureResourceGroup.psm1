# halt immediately on any errors which occur in this module
$ErrorActionPreference = 'Stop'

function Invoke(

    [string]
    [ValidateNotNullOrEmpty()]
    [Parameter(
        Mandatory=$true,
        ValueFromPipelineByPropertyName=$true)]
    $Name,

    [string]
    [ValidateNotNullOrEmpty()]
    [Parameter(
        Mandatory=$true,
        ValueFromPipelineByPropertyName=$true)]
    $Location
){
    
    if(!(Get-AzureResourceGroup | ?{($_.ResourceGroupName -eq $Name) -and ($_.Location -eq $Location)})){
           New-AzureResourceGroup -Name $Name -Location $Location
    }
}

Export-ModuleMember -Function Invoke
