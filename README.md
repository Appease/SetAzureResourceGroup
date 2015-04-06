![](https://ci.appveyor.com/api/projects/status/k6cmufa2prutld3m?svg=true)

####What is it?

An [Appease](http://appease.io) task template that sets an [Azure resource group](http://azure.microsoft.com/en-us/documentation/articles/azure-preview-portal-using-resource-groups/).

####How do I install it?

```PowerShell
Add-AppeaseTask `
    -DevOpName YOUR-DEVOP-NAME `
    -TemplateId SetAzureResourceGroup
```

####What parameters are required?

#####Name
description: a `string` representing the name of the resource group.

#####Location
description: a `string` representing the geographical location of the resource group.  
known allowed values:
```PowerShell
PS C:\> AzureResourceManager\Get-AzureLocation |
    ?{$_.Name -eq 'Microsoft.Resources/resourceGroups'} |
    select LocationsString |
    ft -Wrap

LocationsString                                                                                 
---------------                                                                                 
Central US, East Asia, Southeast Asia, East US, East US 2, West US, North Central US, South     
Central US, North Europe, West Europe, Japan East, Japan West, Brazil South
```
