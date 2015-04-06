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
    # azure returns location strings with whitespace stripped
    $WhitespaceStrippedLocation = $Location -replace '\s', ''

    if(!(AzureResourceManager\Get-AzureResourceGroup | ?{($_.ResourceGroupName -eq $Name) -and ($_.Location -eq $WhitespaceStrippedLocation) -and ($_.ResourceType -eq $ResourceType)})){
           AzureResourceManager\New-AzureResourceGroup -Name $Name -Location $Location
    }
}

Export-ModuleMember -Function Invoke
