# halt immediately on any errors which occur in this module
$ErrorActionPreference = 'Stop'
Import-Module AzureResourceManager

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
    
    if(!(AzureResourceManager\Get-AzureResourceGroup | ?{($_.ResourceGroupName -eq $Name) -and ($_.Location -eq $Location)})){
           AzureResourceManager\New-AzureResourceGroup -Name $Name -Location $Location
    }
}

Export-ModuleMember -Function Invoke
