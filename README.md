![](https://ci.appveyor.com/api/projects/status/rayv6xsibmqf48e8?svg=true)

####What is it?

An [Appease](http://appease.io) task template that sets an [Azure PowerShell](https://github.com/Azure/azure-powershell) account.

####How do I install it?

```PowerShell
Add-AppeaseTask `
    -DevOpName YOUR-DEVOP-NAME `
    -TemplateId SetAzurePowerShellAccount
```

####What parameters are required?

#####Name
description: a `string` representing the name of the resource group.

#####Location
description: a `string` representing the geographical location of the resource group.
tip: for available locations:
```PowerShell
Import-Module AzureResourceManager
AzureResourceManager\Get-AzureLocation | ?{$_.Name -eq 'Microsoft.Resources/resourceGroups'} | select LocationsString

```