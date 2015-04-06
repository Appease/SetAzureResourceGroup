# halt immediately on any errors which occur in this module
$ErrorActionPreference = 'Stop'
Import-Module 'C:\Program Files (x86)\Microsoft SDKs\Azure\PowerShell\ResourceManager\AzureResourceManager' -Force -RequiredVersion '0.8.8'

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
