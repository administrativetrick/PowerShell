Function Get-CMContentDistributionStatus {
    <#
    .SYNOPSIS
	    This monitors the Content Distribution status of a given PackageID
    .DESCRIPTION
	    This monitors the Content Distribution status of a given PackageID. It can show the PackageID, Software Name, SourceVersion, How many servers are Targets, completed, and more.
        It continues to run in a loop until the Numbre in progress reaches 0. If an e-mail address is entered it will send out an e-mail to the address listed.
    .PARAMETER ProviderMachineName
	    This is the SMS Provider Machine Name it will be different for every environment.
    .PARAMETER SiteCode
	    This should be set to the SiteCode for your Environment.
    .PARAMETER FromEmail
	    This should be set to your email address or the email address that you want notifications to come from.
    .PARAMETER ToEmail
	    This should be set to your email address or the email address that you want notifications to be sent to.
    .PARAMETER SmtpServer
	    This should be set to the SMTP Server of your e-mail provider that you will be sending notifications from.
    .PARAMETER PackageID
	    Place the PackageID of the Package that you will be monitoring here.
    .EXAMPLE
        Get-CMContentDistributionStatus -PackageID 'PKG00123'

        Monday, May 6, 2019 11:44:38 AM
        DateCreated      : 5/3/2019 11:40:57 AM
        Description      : 
        LastUpdateDate   : 5/3/2019 9:31:46 PM
        NumberErrors     : 6
        NumberInProgress : 25
        NumberSuccess    : 68
        NumberUnknown    : 0
        PackageID        : PKG00123
        SoftwareName     : Your Software 1.0
        SourceVersion    : 4
        Targeted         : 80

    .EXAMPLE
        Get-CMContentDistributionStatus -PackageID 'PKGID001' -ToEmail "myemailaddress@centene.com" -FromEmail "myemailaddress@centene.com"

        Monday, May 6, 2019 11:44:38 AM
        DateCreated      : 5/3/2019 11:40:57 AM
        Description      : 
        LastUpdateDate   : 5/3/2019 9:31:46 PM
        NumberErrors     : 6
        NumberInProgress : 25
        NumberSuccess    : 68
        NumberUnknown    : 0
        PackageID        : PKGID001
        SoftwareName     : Your Software 1.0
        SourceVersion    : 4
        Targeted         : 80
    #>
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [string]$SiteCode = "OFL",
        [Parameter(Mandatory = $false)]
        [string]$ProviderMachineName,
        [Parameter(Mandatory = $false)]
        [string]$FromEmail,
        [Parameter(Mandatory = $false)]
        [string]$ToEmail,
        [Parameter(Mandatory = $false)]
        [string]$SmtpServer,
        [Parameter(Mandatory = $true)]
        [string]$PackageID
    )

    begin {
        # Uncomment the line below if running in an environment where script signing is required.
        #Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
    }

    process {
        # Customizations
        $initParams = @{}
        #$initParams.Add("Verbose", $true) # Uncomment this line to enable verbose logging
        #$initParams.Add("ErrorAction", "Stop") # Uncomment this line to stop the script on any errors

        # Do not change anything below this line

        # Import the ConfigurationManager.psd1 module 
        if ((Get-Module ConfigurationManager) -eq $null) {
            Import-Module "$($ENV:SMS_ADMIN_UI_PATH)\..\ConfigurationManager.psd1" @initParams 
        }

        # Connect to the site's drive if it is not already present
        if ((Get-PSDrive -Name $SiteCode -PSProvider CMSite -ErrorAction SilentlyContinue) -eq $null) {
            New-PSDrive -Name $SiteCode -PSProvider CMSite -Root $ProviderMachineName @initParams
        }

        # Set the current location to be the site code.
        Push-Location "$($SiteCode):\" @initParams

        $Result = get-cmdistributionstatus -id $PackageID | Select-Object -Property DateCreated, Description, LastUpdateDate, NumberErrors, NumberInProgress, NumberSuccess, NumberUnknown, PackageID, SoftwareName, SourceVersion, Targeted
        While ($Result.NumberInProgress -gt 1) {
            $Result = get-cmdistributionstatus -id $PackageID | Select-Object -Property DateCreated, Description, LastUpdateDate, NumberErrors, NumberInProgress, NumberSuccess, NumberUnknown, PackageID, SoftwareName, SourceVersion, Targeted
            Clear-Host
            Write-Host (Get-Date).DateTime
            $Result
            Start-Sleep 10
        }
        $message = "$($Result.NumberSuccess) were updated Sucessfully; $($Result.NumberInProgress) Were Still in Progress; $($Result.NumberErrors) Failed"
        Write-Host "$message"
        If (($ToEmail -and $FromEmail) -ne $null) {
            Send-MailMessage -Body "Your Content for $PackageID has finished distribution. $message. To view more details look at the Content Status in the SCCM Admin Console" -From "$fromEmail" -SmtpServer "$SmtpServer" -To "$toEmail"
        }
        Pop-Location
    }
    End {

    }
}
