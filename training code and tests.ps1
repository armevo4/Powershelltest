Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name "ConsentPromptBehaviorUser" | Out-File C:\Users\am001169\Music\Powershell learning -Name test.txt
Set-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name "ConsentPromptBehaviorUser" -Value 3
Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name "ConsentPromptBehaviorUser" | Out-File C:\Users\am001169\Music\Powershell learning -Name test.txt

Get-NetAdapter
 Invoke-Command -ComputerName amerecd1, amerecd2 -ScriptBlock {Get-WinEvent -LogName security -MaxEvents 5}
Get-WinEvent security -MaxEvents 5
 Get-Process | Sort-Object ws -Descending | select -first 5
 Get-Process |Where-Object {$_.Handles -gt 1000}
Get-Process | Select-Object -Property name, @{name='procid';expression={$_.id}}
Get-Process | Format-List
(Get-Process | Where-Object {$_.name -eq "notepad"}).kill()
 Get-Process | Where-Object {$_.name -eq "notepad"} | Stop-Process
 Get-NetAdapter |Where-Object {$_.Name -like "Ethernet*" } | Enable-NetAdapter
Enable-PSRemoting
Invoke-Command -ComputerName amere30105 -ScriptBlock {Get-WinEvent -LogName security -MaxEvents 5} -Credential eur\am001169
Invoke-Command -ComputerName amere30105 -ScriptBlock { Get-NetAdapter |Where-Object {$_.Name -like "Ethernet*" } | Enable-NetAdapter }


$procs = get-process
$procs2 = get-process
Compare-Object -ReferenceObject $procs -DifferenceObject $procs2 -Property Name
get-process | Stop-Process -WhatIf

Get-ADUser -filter {name -like "am001171" }  | Out-File -FilePath C:\Users\Public\test.txt

 Enter-PSSession -ComputerName amerecd1
 Get-ADUser -Filter * -Properties "LastLogonDate"

get-aduser -filter "Country -eq 'Armenia'" -Properties "LastLogonDate" -Credential "am001169"| where {$_.LastLogonDate -le (Get-Date).AddDays(-60)}
get-aduser -filter * -Properties "LastLogonDate" -Credential "am001169"| where {$_.LastLogonDate -le (Get-Date).AddDays(-60)}

get-aduser -filter * -Properties "DistinguishedName" -Credential "am001169" | where {$_.DistinguishedName -cmatch "Armenia"} |Sort-Object -Property Name -desc

Get-ADComputer -filter * -Properties "DistinguishedName" -Credential "am001169" | where {$_.DistinguishedName -cmatch "Armenia"} |Sort-Object -Property Name -desc | Out-File -FilePath C:\Users\am001169\Music\Powershell-learning\adcomputers.txt

Get-ADComputer -filter * -Properties "DistinguishedName" "LastLogonDate" -Credential "am001169" | where {$_.DistinguishedName -cmatch "Armenia"}, {$_.LastLogonDate -le (Get-Date).AddDays(-60)} | Sort-Object -Property Name -desc | Format-Table -Property name, lastlogondate -AutoSize |Out-File -FilePath C:\Users\am001169\Music\Powershell-learning\adcomputers.txt

Get-ADuser -filter * -Properties ('DistinguishedName','LastLogonDate') | where {$_.DistinguishedName -cmatch "Armenia"} | where {$_.LastLogonDate -le (Get-Date).AddDays(-1) } | Sort-Object -Property LastLOgonDate -Desc | Format-Table -Property name, lastlogondate -AutoSize

Copy-Item \\amereid4\c$\Users\AM001169\Documents\test.txt -destination c:\users\am001169\

 Get-ADuser -filter * -Properties ('DistinguishedName','LastLogonDate') -Credential "am001169" | where {$_.DistinguishedName -cmatch "Armenia"} | where {$_.LastLogonDate -le (Get-Date).AddDays(-20) } | Sort-Object -Property LastLOgonDate -Desc | Format-Table -Property name, lastlogondate,givenname,surname -AutoSize | Out-File test.txt

Test-Path -Path \\amerecd2\c$

get-process notepad
or
 Get-Process | where {$_.name -eq "notepad"} | Stop-Process
 $ConfirmPreference = "medium"    or  $ConfirmPreference = "high"  to get confirmation 
Get-Process | where {$_.name -eq "notepad"} | Stop-Process -Confirm    or    Get-Process | where {$_.name -eq "notepad"} | Stop-Process -Confirm:$false

get-member  is used to get all the member type  exp   get-service|get-member

$_  is for every object to go to the pipline(get all processes ,where process property name is equal to notepad)  for exp  get-process | where-object {$_.name -eq "notepad"} |stop-process

get-service | where-object {$_.status -eq "stopped"}  | start-service -whatif

get-process | where {$_.handlecount -gt 900}  or get-process | where{$psitem.hadlecount -gt 900}  or get-process | where handlecount -gt 900

? is where allias     get-allias ?   ktesnenq  kam sax aliasnere   get-alias 





 
