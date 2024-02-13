# Install-Structure Scripts

<p align="center">
 <a href="https://youtube.com/julianv"><img title="Julian-V" src="docs/Julian-V.png"></a><br>
 <a href="https://www.youtube.com/julianv?sub_confirmation=1"><img title="YouTube Channel Subscribers" src="https://img.shields.io/youtube/channel/subscribers/UC8QPaA8hLDhroGdBtAImmbQ"></a><br> 
  <a href=""><img title="Install-Structure" src="https://img.shields.io/badge/Scripts-%20?logo=powershell&logoColor=00BFFF&label=Install Structure&color=A52A2A"></a>
 <a href="#install-structure"><img title="Version" src="https://img.shields.io/badge/1.0-%20?logo=hackthebox&label=Version&color=BA55D3"></a>
 <a href="LICENSE"><img title="License" src="https://img.shields.io/github/license/julianv22/install-structure?logo=atom&label=License&labelColor=teal"></a>
 <!-- <a href="https://github.com/julianv22/install-structure/actions/workflows/main.yml"><img title="Actions" src="https://github.com/julianv22/install-structure/actions/workflows/main.yml/badge.svg"></a> -->
 <a href="#"><img title="Commits" src="https://img.shields.io/github/commit-activity/t/julianv22/install-structure?logo=git&label=Commits"></a>
 <a href="https://github.com/julianv22/install-structure/commits/main"><img title="Last Commit" src="https://img.shields.io/github/last-commit/julianv22/install-structure?logo=codacy&label=Last%20Commit&labelColor=2F4F4F"></a>
</p>

# Manual Installing

### Set Execution Policy

```PowerShell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

### Install scoop

```PowerShell
iex "& {$(irm get.scoop.sh)} -RunAsAdmin";
scoop install git;
scoop bucket add extras;
scoop bucket add games;
scoop bucket add java;
scoop bucket add main;
scoop bucket add nerd-fonts;
scoop bucket add nonportable;
scoop bucket add versions;
```

### Install apps

```PowerShell
scoop install windows-terminal pwsh;
scoop install oh-my-posh terminal-icons;
scoop install SourceCodePro-NF-Mono steam brave;
# scoop install trafficmonitor
```

### Create PowerShell's Profile

```PowerShell
New-Item -Path $PROFILE -Type File -Force
```

```PowerShell
Start-BitsTransfer -Source "https://raw.githubusercontent.com/julianv22/install-structure/main/PowerShell/Microsoft.PowerShell_profile.ps1" -Destination $PROFILE;
.$PROFILE
```

# Importing Registry

### 7-Zip
Add 7-Zip as a context menu option by running: 
```PowerShell
reg import "C:\Users\Administrator\scoop\apps\7zip\current\install-context.reg"
```

### Git

Set Git Credential Manager Core by running: 
```PowerShell
reg import "git config --global credential.helper manager"
```

To add context menu entries, run
```PowerShell
reg import 'C:\Users\Administrator\scoop\apps\git\current\install-context.reg'
```

To create file-associations for .git* and .sh files, run 
```PowerShell
reg import 'C:\Users\Administrator\scoop\apps\git\current\install-file-associations.reg'
```

### PowerShell

Add PowerShell Core as a explorer context menu by running:
```PowerShell
reg import 'C:\Users\Administrator\scoop\apps\pwsh\current\install-explorer-context.reg'
```
For file context menu, run 
```PowerShell
reg import 'C:\Users\Administrator\scoop\apps\pwsh\current\install-file-context.reg'
```

### Windows Terminal

Add Windows Terminal as a context menu option by running 
```PowerShell
reg import "C:\Users\Administrator\scoop\apps\windows-terminal\current\install-context.reg"
```   
