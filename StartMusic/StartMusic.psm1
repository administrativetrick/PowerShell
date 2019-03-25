Function Start-Music 
{
<#
.SYNOPSIS
	Plays out the Mission Impossible Song using a series of beeps.
.DESCRIPTION
	Plays out the Mission Impossible Song using a series of beeps.
.PARAMETER ComputerName
	The name of the computer to run this against.
.EXAMPLE
    Start-MissionImpossible
.EXAMPLE
Start-MissionImpossible -ComputerName "Computer01"
#>
[CmdletBinding()]
Param (
		[Parameter(Mandatory = $true)]
		[ValidateSet("MissionImpossible", "SuperMario", "StarWars")]
		[string]$Song = "MissionImpossible"
)
process
	{
		If ($song -eq "MissionImpossible")
		{
        [console]::beep(784,150) 
        Start-Sleep -m 300 
        [console]::beep(784,150) 
        Start-Sleep -m 300 
        [console]::beep(932,150) 
        Start-Sleep -m 150 
        [console]::beep(1047,150) 
        Start-Sleep -m 150 
        [console]::beep(784,150) 
        Start-Sleep -m 300 
            [console]::beep(784,150) 
        Start-Sleep -m 300 
            [console]::beep(699,150) 
        Start-Sleep -m 150 
        [console]::beep(740,150) 
        Start-Sleep -m 150 
            [console]::beep(784,150) 
        Start-Sleep -m 300 
            [console]::beep(784,150) 
        Start-Sleep -m 300 
            [console]::beep(932,150) 
        Start-Sleep -m 150 
            [console]::beep(1047,150) 
        Start-Sleep -m 150 
            [console]::beep(784,150) 
        Start-Sleep -m 300 
        [console]::beep(784,150) 
        Start-Sleep -m 300 
            [console]::beep(699,150) 
        Start-Sleep -m 150 
        [console]::beep(740,150) 
        Start-Sleep -m 150 
        [console]::beep(932,150) 
        [console]::beep(784,150) 
            [console]::beep(587,1200) 
        Start-Sleep -m 75 
            [console]::beep(932,150) 
        [console]::beep(784,150) 
        [console]::beep(554,1200) 
        Start-Sleep -m 75 
        [console]::beep(932,150) 
        [console]::beep(784,150) 
        [console]::beep(523,1200) 
        Start-Sleep -m 150 
        [console]::beep(466,150) 
        [console]::beep(523,150)
		}
		If ($Song -eq "SuperMario")
		{
			[System.Console]::Beep(659, 125)
			[System.Console]::Beep(659, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(659, 125)
			Start-Sleep -Milliseconds 167
			[System.Console]::Beep(523, 125)
			[System.Console]::Beep(659, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(784, 125)
			Start-Sleep -Milliseconds 375
			[System.Console]::Beep(392, 125)
			Start-Sleep -Milliseconds 375
			[System.Console]::Beep(523, 125)
			Start-Sleep -Milliseconds 250
			[System.Console]::Beep(392, 125)
			Start-Sleep -Milliseconds 250
			[System.Console]::Beep(330, 125)
			Start-Sleep -Milliseconds 250
			[System.Console]::Beep(440, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(494, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(466, 125)
			Start-Sleep -Milliseconds 42
			[System.Console]::Beep(440, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(392, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(659, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(784, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(880, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(698, 125)
			[System.Console]::Beep(784, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(659, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(523, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(587, 125)
			[System.Console]::Beep(494, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(523, 125)
			Start-Sleep -Milliseconds 250
			[System.Console]::Beep(392, 125)
			Start-Sleep -Milliseconds 250
			[System.Console]::Beep(330, 125)
			Start-Sleep -Milliseconds 250
			[System.Console]::Beep(440, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(494, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(466, 125)
			Start-Sleep -Milliseconds 42
			[System.Console]::Beep(440, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(392, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(659, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(784, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(880, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(698, 125)
			[System.Console]::Beep(784, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(659, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(523, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(587, 125)
			[System.Console]::Beep(494, 125)
			Start-Sleep -Milliseconds 375
			[System.Console]::Beep(784, 125)
			[System.Console]::Beep(740, 125)
			[System.Console]::Beep(698, 125)
			Start-Sleep -Milliseconds 42
			[System.Console]::Beep(622, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(659, 125)
			Start-Sleep -Milliseconds 167
			[System.Console]::Beep(415, 125)
			[System.Console]::Beep(440, 125)
			[System.Console]::Beep(523, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(440, 125)
			[System.Console]::Beep(523, 125)
			[System.Console]::Beep(587, 125)
			Start-Sleep -Milliseconds 250
			[System.Console]::Beep(784, 125)
			[System.Console]::Beep(740, 125)
			[System.Console]::Beep(698, 125)
			Start-Sleep -Milliseconds 42
			[System.Console]::Beep(622, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(659, 125)
			Start-Sleep -Milliseconds 167
			[System.Console]::Beep(698, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(698, 125)
			[System.Console]::Beep(698, 125)
			Start-Sleep -Milliseconds 625
			[System.Console]::Beep(784, 125)
			[System.Console]::Beep(740, 125)
			[System.Console]::Beep(698, 125)
			Start-Sleep -Milliseconds 42
			[System.Console]::Beep(622, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(659, 125)
			Start-Sleep -Milliseconds 167
			[System.Console]::Beep(415, 125)
			[System.Console]::Beep(440, 125)
			[System.Console]::Beep(523, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(440, 125)
			[System.Console]::Beep(523, 125)
			[System.Console]::Beep(587, 125)
			Start-Sleep -Milliseconds 250
			[System.Console]::Beep(622, 125)
			Start-Sleep -Milliseconds 250
			[System.Console]::Beep(587, 125)
			Start-Sleep -Milliseconds 250
			[System.Console]::Beep(523, 125)
			Start-Sleep -Milliseconds 1125
			[System.Console]::Beep(784, 125)
			[System.Console]::Beep(740, 125)
			[System.Console]::Beep(698, 125)
			Start-Sleep -Milliseconds 42
			[System.Console]::Beep(622, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(659, 125)
			Start-Sleep -Milliseconds 167
			[System.Console]::Beep(415, 125)
			[System.Console]::Beep(440, 125)
			[System.Console]::Beep(523, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(440, 125)
			[System.Console]::Beep(523, 125)
			[System.Console]::Beep(587, 125)
			Start-Sleep -Milliseconds 250
			[System.Console]::Beep(784, 125)
			[System.Console]::Beep(740, 125)
			[System.Console]::Beep(698, 125)
			Start-Sleep -Milliseconds 42
			[System.Console]::Beep(622, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(659, 125)
			Start-Sleep -Milliseconds 167
			[System.Console]::Beep(698, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(698, 125)
			[System.Console]::Beep(698, 125)
			Start-Sleep -Milliseconds 625
			[System.Console]::Beep(784, 125)
			[System.Console]::Beep(740, 125)
			[System.Console]::Beep(698, 125)
			Start-Sleep -Milliseconds 42
			[System.Console]::Beep(622, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(659, 125)
			Start-Sleep -Milliseconds 167
			[System.Console]::Beep(415, 125)
			[System.Console]::Beep(440, 125)
			[System.Console]::Beep(523, 125)
			Start-Sleep -Milliseconds 125
			[System.Console]::Beep(440, 125)
			[System.Console]::Beep(523, 125)
			[System.Console]::Beep(587, 125)
			Start-Sleep -Milliseconds 250
			[System.Console]::Beep(622, 125)
			Start-Sleep -Milliseconds 250
			[System.Console]::Beep(587, 125)
			Start-Sleep -Milliseconds 250
			[System.Console]::Beep(523, 125)
			Start-Sleep -Milliseconds 625
		}
		If ($Song -eq "StarWars")
		{
			[console]::beep(440, 500)
			[console]::beep(440, 500)
			[console]::beep(440, 500)
			[console]::beep(349, 350)
			[console]::beep(523, 150)
			[console]::beep(440, 500)
			[console]::beep(349, 350)
			[console]::beep(523, 150)
			[console]::beep(440, 1000)
			[console]::beep(659, 500)
			[console]::beep(659, 500)
			[console]::beep(659, 500)
			[console]::beep(698, 350)
			[console]::beep(523, 150)
			[console]::beep(415, 500)
			[console]::beep(349, 350)
			[console]::beep(523, 150)
			[console]::beep(440, 1000)
		}
	}
}