[CmdletBinding()]
param( 
    [Parameter(Mandatory = $true)]
    [string] $Kustomization,

    [Parameter(Mandatory = $true)]
    [string] $Namespace,

    [Parameter(Mandatory = $true)]
    [string] $Deployment
)

function Deploy() {
    [CmdletBinding()]
    param( 
        [Parameter(Mandatory = $true)]
        [string] $Kustomization,

        [Parameter(Mandatory = $true)]
        [string] $Namespace,
    
        [Parameter(Mandatory = $true)]
        [string] $Deployment
    )

    Write-Host "Deploying Kustomization '$Kustomization'..."
    kubectl kustomize $Kustomization | kubectl -n $Namespace apply -f -

    Write-Host "Waiting for deployment..."
    kubectl -n $Namespace rollout status "deployment.apps/$Deployment"
}
        
Deploy -Kustomization $Kustomization -Namespace $Namespace -Deployment $Deployment