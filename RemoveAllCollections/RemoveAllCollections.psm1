Function Remove-AllCollections
{
<#
  .SYNOPSIS
  Removes all the collections that it can find in SCCM
  .DESCRIPTION
   Removes all the collections that it can find in SCCM Accepts Wildcards
  .EXAMPLE
  Remove-AllCollections -CollectionName "SDD - CNC - Vendor Application Version 1.0"
  .EXAMPLE
  Remove-AllCollections -CollectionName "*Vendor Application Version 1.0"
  .PARAMETER CollectionName
  The name of the collection in SCCM
  #>
[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [parameter(Mandatory=$true)]
		[ValidateNotNullOrEmpty()]
		[Alias("Name")]
		[string]$CollectionName,
		[switch]$Force
)
	Process
	{
		try
		{
			If (get-module -Name "ConfigurationManager") { Write-Verbose "Configuration Manager Module Detected" }
			Else
			{
				try
				{
					If (Test-Path -Path Test-Path $env:SMS_ADMIN_UI_PATH\..\)
					{
						Import-Module -Name "$env:SMS_ADMIN_UI_PATH\..\ConfigurationManager.psd1"
					}
					Else
					{
						Write-Verbose "You do not have Configuration Manager Installed on this machine."
					}
				}
				catch
				{
					Write-Error "You do not have Configuration Manager Installed on this machine."
				}
				
			}
			Set-Location OFL:\
			$Collections = (Get-CMDeviceCollection -Name $CollectionName).Name
			
			foreach ($Collection in $Collections)
			{
				If ($Force -or $PSCmdlet.ShouldProcess("$Collection", "Removing Collection")) {
					Remove-CMDeviceCollection -Name $Collection
					Write-Host "Removed $Collection"
					}
			}
			cd c:\
		}
		catch
		{
			Write-Error "Failed to remove the collection(s)"
		}
	}
	End {

}
}
