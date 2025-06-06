#$env:SCOOP = 'D:\Scoop'
#$env:SCOOP_APPS="$env:SCOOP\apps"

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\quick-term.omp.json" | Invoke-Expression

Import-Module Terminal-Icons
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

#function JX-Location {Set-Location -Path D:\jx-offline; ls}
#Set-Alias -Name jx -Value JX-Location

function S-Update {
	scoop update
	scoop update -a
	scoop status
	S-Clean
}

function S-Clean {
	scoop cleanup -a
	scoop cache rm -a
}

function PS-Windows-Update {
	if (Get-Module -ListAvailable -Name PSWindowsUpdate) {
		Write-Warning "PSWindowsUpdate is already installed"
	} else {
		Write-Host "Installing PSWindowsUpdate..."
		Install-Module PSWindowsUpdate -Force
		Add-WUServiceManager -MicrosoftUpdate -Confirm:$false
	}
}

function W-Update {
	Write-Host ">> Get 'winget' updatable..." -ForegroundColor Green
	winget update
	Write-Host; Write-Host ">> Get-WindowsUpdate..." -ForegroundColor Green
	Get-WindowsUpdate
}

function Delete-Temp {
#Parameter
$Directories = "$env:USERPROFILE\AppData\Local\Temp", "C:\Windows\Temp"

#Delete files in each directory
	ForEach ($Dir in $Directories) {
		Remove-Item -Path $Dir -Recurse -Force
	}
}
# (Get-PSReadLineOption).HistorySavePath
