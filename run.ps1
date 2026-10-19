if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

if (-not (Get-LocalUser -Name hello -ErrorAction SilentlyContinue)) {
    $p = ConvertTo-SecureString 'hello' -AsPlainText -Force
    New-LocalUser -Name hello -Password $p -PasswordNeverExpires -Description 'SSH test user'
}

Set-Service -Name sshd -StartupType Automatic
Start-Service sshd

$f = 'C:\ProgramData\ssh\sshd_config'
$c = Get-Content $f
if ($c -match '^Port\s') { $c = $c -replace '^Port\s.*', 'Port 8080' } else { $c += 'Port 8080' }
if ($c -match '(?im)^\s*PasswordAuthentication\s') { $c = $c -replace '(?im)^\s*PasswordAuthentication\s.*', 'PasswordAuthentication yes' } else { $c += 'PasswordAuthentication yes' }
Set-Content -Path $f -Value $c

Get-NetFirewallRule -Name sshd -ErrorAction SilentlyContinue | Remove-NetFirewallRule
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 8080 | Out-Null

Restart-Service sshd
