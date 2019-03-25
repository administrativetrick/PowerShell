Function Get-CMClientCacheSize {
    <#
    .SYNOPSIS
	    This script checks the SCCM cache size of a given computer.
    .DESCRIPTION
	    This script checks the SCCM cache size of a given computer.
    .PARAMETER ComputerName
	    The name of the computer to run this against.
    .EXAMPLE
        Get-CMClientCacheSize
    .EXAMPLE
    Get-CMClientCacheSize -ComputerName "Computer01"
    #>
    [CmdletBinding()]
    Param (
	    [Parameter(Mandatory=$false)]
	    [string]$ComputerName = $env:COMPUTERNAME
    )
	
	process
	{
		foreach ($computer in $ComputerName)
		{
			$Cache = Get-WmiObject -ComputerName $computer -namespace root\ccm\SoftMgmtAgent -class CacheConfig
			$outputObject = [pscustomobject]@{
				ComputerName = $Cache.PSComputerName
				CacheSize = $Cache.size
			}
			$outputObject
		}
	}
}

Function Set-CMClientCacheSize
{
    <#
    .SYNOPSIS
	    This script checks the SCCM cache size of a given computer.
    .DESCRIPTION
	    This script checks the SCCM cache size of a given computer.
    .PARAMETER ComputerName
	    The name of the computer to run this against.
    .EXAMPLE
        Get-CMClientCacheSize
    .EXAMPLE
    Get-CMClientCacheSize -ComputerName "Computer01"
    #>
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory = $false)]
		[string]$ComputerName = $env:COMPUTERNAME,
		[Parameter(Mandatory = $false)]
		[string]$CacheSize = 10240
	)
	
	process
	{
		foreach ($computer in $ComputerName)
		{
			$Cache = Get-WmiObject -ComputerName $computer -namespace root\ccm\SoftMgmtAgent -class CacheConfig
			$Cache.size = $CacheSize
			$Cache.Put()
			Restart-Service ccmexec
		}
	}
}