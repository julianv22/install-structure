Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0

# Function
function Write-Start {
	param ($msg)
	Write-Host (">> " + $msg) -ForegroundColor Green
}

function Write-App {
	param ($msg)
	Write-Host $msg -ForegroundColor Magenta
}

function Write-Done { Write-Host "DONE" -ForegroundColor Yellow; Write-Host }

# START
Write-Start "Installing scoop..."
if (Get-Command scoop -errorAction SilentlyContinue) {
	Write-Warning "Scoop is already installed"
}
else {
	iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
	# irm get.scoop.sh | iex
	# irm christitus.com/win | iex
}
Write-Done

Write-Start "Installing git & buckets..."
scoop install git;
scoop bucket add extras;
scoop bucket add games;
scoop bucket add java;
scoop bucket add main;
scoop bucket add nerd-fonts;
scoop bucket add nonportable;
scoop bucket add versions;
Write-Done

Write-Start "Installing Windows Terminal & Powershell..."
scoop install windows-terminal pwsh;
scoop install oh-my-posh terminal-icons;
if (!(test-path $PROFILE)) {
	New-Item -Path $PROFILE -Type File -Force
}
Start-BitsTransfer -Source "https://raw.githubusercontent.com/julianv22/install-structure/main/PowerShell/Microsoft.PowerShell_profile.ps1" -Destination $PROFILE
. $PROFILE
Write-Done

Write-Start "Installing apps..."
Write-App "<# Fonts #>";
scoop install SourceCodePro-NF-Mono
Write-App "<# Dev Apps #>";
scoop install nodejs python vscode notepadplusplus 
# scoop install kate
Write-App "<# Sofwares #>";
scoop install obs-studio
scoop install vlc vcredist-aio
scoop install kdeconnect
# scoop install discord wpsoffice bleachbit hibit-uninstaller brave bitwarden qttabbar-np
Write-App "<# Games #>";
scoop install steam
# Write-App "<# JX-Tools #>";
# scoop install winscp hxd ida-free
Write-App "<# Tweak Apps #>";
# scoop install neofetch btop nano 
scoop install shutup10 winget
# scoop install trafficmonitor nilesoft-shell	
Write-Host "Add 'Open with Code' to Context Menu..."
reg import "$env:SCOOP_APPS\vscode\current\install-context.reg"
reg import "$env:SCOOP_APPS\vscode\current\install-associations.reg"
Write-Done

Write-Start "Checking update..."
S-Update
Write-Done
wt btop # Open Windows Terminal with BTOP
# END
