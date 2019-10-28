[CmdletBinding()]
param( 
    [Parameter(Mandatory = $true)]
    [string] $Path,

    [Parameter(Mandatory = $true)]
    [string[]] $Replace
)

function Subst() {
    [CmdletBinding()]
    param( 
        [Parameter(Mandatory = $true)]
        [string] $Path,

        [Parameter(Mandatory = $true)]
        [string[]] $Replace
    )

    $Command = "((Get-Content -Path $Path -Raw) -Replace $Replace) | Set-Content -Path $Path"
    Write-Host "Command: $Command" 
    
    ((Get-Content -Path $Path -Raw) -Replace $Replace) | Set-Content -Path $Path
}
        
Subst -Path $Path -Replace $Replace