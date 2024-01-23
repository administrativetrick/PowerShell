function Convert-ROT13 {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Text
    )

    process {
        $convertedText = $Text.ToCharArray() | ForEach-Object {
            $char = $_
            $charInt = [int][char]$char
            if ($charInt -ge [int][char]'a' -and $charInt -le [int][char]'z') {
                return [char](($charInt - [int][char]'a' + 13) % 26 + [int][char]'a')
            }
            elseif ($charInt -ge [int][char]'A' -and $charInt -le [int][char]'Z') {
                return [char](($charInt - [int][char]'A' + 13) % 26 + [int][char]'A')
            }
            else {
                return $char
            }
        }

        -join $convertedText
    }
}
