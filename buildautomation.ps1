﻿#Cloning the repository from git hub
git clone "https://github.com/obulu/samplebabu.git"

#Building the solution file
function buildVS
{
    param
    (
        [parameter(Mandatory=$true)]
        [String] $path,

        [parameter(Mandatory=$false)]
        [bool] $nuget = $true,
        
        [parameter(Mandatory=$false)]
        [bool] $clean = $true
    )
    process
    {
        $msBuildExe = 'C:\Program Files (x86)\MSBuild\14.0\Bin\msbuild.exe'

        if ($nuget) {
            Write-Host "Restoring NuGet packages" -foregroundcolor green
            nuget restore "$($path)"
        }

        if ($clean) {
            Write-Host "Cleaning $($path)" -foregroundcolor green
            & "$($msBuildExe)" "$($path)" /t:Clean /m
        }

        Write-Host "Building $($path)" -foregroundcolor green
        & "$($msBuildExe)" "$($path)" /t:Build /m
    }
}

# nuget restore and build solution
buildVS -path .\Users\BabuO\Documents\SimpleSurvey.sln -clean $false


#Build validation

if($?) {
	# True, Build succeeded
}

if (!$?) {
	# Not True, Build failed
}
