$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..\..\..')).Path
$lumiRoot = Join-Path $repoRoot 'nuevas-librerias-h5p'

$joubelSrc = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$joubelDst = Join-Path $lumiRoot 'H5P.JoubelUICFRD-1.0'

function Reset-Directory {
    param([string]$Path)

    if (Test-Path $Path) {
        Remove-Item -Path $Path -Recurse -Force
    }

    New-Item -ItemType Directory -Path $Path -Force | Out-Null
}

function Copy-IfExists {
    param(
        [string]$Source,
        [string]$Destination
    )

    if (-not (Test-Path $Source)) {
        Write-Warning "Missing source file: $Source"
        return
    }

    $destDir = Split-Path $Destination -Parent

    if ($destDir -and -not (Test-Path $destDir)) {
        New-Item -ItemType Directory -Path $destDir -Force | Out-Null
    }

    Copy-Item -Path $Source -Destination $Destination -Force
}

function Copy-DirectoryContents {
    param(
        [string]$SourceDir,
        [string]$DestinationDir
    )

    if (-not (Test-Path $SourceDir)) {
        Write-Warning "Missing source directory: $SourceDir"
        return
    }

    Get-ChildItem -Path $SourceDir -Recurse -File | ForEach-Object {
        $relativePath = $_.FullName.Substring($SourceDir.Length).TrimStart('\')
        $targetPath = Join-Path $DestinationDir $relativePath
        Copy-IfExists $_.FullName $targetPath
    }
}

Write-Host "Syncing JoubelUICFRD -> $joubelDst"
Reset-Directory $joubelDst

Copy-IfExists (Join-Path $joubelSrc 'library.json') (Join-Path $joubelDst 'library.json')
Copy-DirectoryContents (Join-Path $joubelSrc 'js') (Join-Path $joubelDst 'js')
Copy-DirectoryContents (Join-Path $joubelSrc 'css') (Join-Path $joubelDst 'css')
Copy-DirectoryContents (Join-Path $joubelSrc 'fonts') (Join-Path $joubelDst 'fonts')

Write-Host "Done."
