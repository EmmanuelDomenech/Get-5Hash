#Develepers: Emmanuel Domenech
#Date: 02/08/2022
#The script will allowed you to get a file hash from a machine remotely. And will provide 5 algorithm (MD5,SHA1,SHA256,SHA384,SHA512).
#Make sure to open output .csv file on Excel for better view.
$COMPUTERNAME = Read-Host "Enter Remote Computer Name"
$File = Read-Host "Enter File Path"
$PATH = ($PSScriptRoot+"\"+$COMPUTERNAME+"_PSOutput.csv")
$GET = Invoke-Command -ComputerName $COMPUTERNAME -ScriptBlock {Get-FileHash -Path $Using:File -Algorithm MD5}
$GET | Export-Csv -Encoding UTF8 -NoTypeInformation -Append -Path $PATH
$GET = Invoke-Command -ComputerName $COMPUTERNAME -ScriptBlock {Get-FileHash -Path $Using:File -Algorithm SHA1}
$GET | Export-Csv -Encoding UTF8 -NoTypeInformation -Append -Path $PATH
$GET = Invoke-Command -ComputerName $COMPUTERNAME -ScriptBlock {Get-FileHash -Path $Using:File -Algorithm SHA256}
$GET | Export-Csv -Encoding UTF8 -NoTypeInformation -Append -Path $PATH
$GET = Invoke-Command -ComputerName $COMPUTERNAME -ScriptBlock {Get-FileHash -Path $Using:File -Algorithm SHA384}
$GET | Export-Csv -Encoding UTF8 -NoTypeInformation -Append -Path $PATH
$GET = Invoke-Command -ComputerName $COMPUTERNAME -ScriptBlock {Get-FileHash -Path $Using:File -Algorithm SHA512}
$GET | Export-Csv -Encoding UTF8 -NoTypeInformation -Append -Path $PATH
