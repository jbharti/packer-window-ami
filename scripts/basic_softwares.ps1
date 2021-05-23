echo "=============Set India Standard Time Zone============="
tzutil /s "India Standard Time"
reg query HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation

echo "=============Create D Drive============="
Initialize-Disk -Number 1
New-Partition -DiskNumber 1 -UseMaximumSize -DriveLetter D
Format-Volume -DriveLetter D -FileSystem NTFS -NewFileSystemLabel Data -Confirm:$false

echo "=============Install chocolatey============="
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
echo "=============Install Notepad++============="
choco install notepadplusplus -y
echo "=============Install JDK============="
choco install jdk8 -y
echo "=============Install JRE============="
choco install javaruntime -y
echo "=============Install AWS CLI============="
choco install awscli -y
echo "=============Install GIT============="
choco install git -y
echo "=============Install 7zip============="
choco install 7zip.install -y