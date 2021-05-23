echo "=============Open openssh for Jenkins============="
Get-WindowsCapability -Online | ? Name -like 'OpenSSH*'
Start-Sleep -s 15
echo "=============Install the OpenSSH Client=============" 
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
echo "=============Install the OpenSSH Server============="
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
echo "=============OPTIONAL but recommended============="
Start-Service sshd
echo "=============Confirm the Firewall rule is configured. It should be created automatically by setup============="
Set-Service -Name sshd -StartupType 'Automatic'
echo "=============Confirm the Firewall rule is configured. It should be created automatically by setup============="
Get-NetFirewallRule -Name *ssh*
echo "=============If the firewall does not exist, create one============="
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22