winrm uses http port 5985  , https uses 5986 

enable-psremoting or from GP or get-pssessionconfiguration

$env:computername  check computer name

Invoke-Command -ComputerName amereid4 {$env:COMPUTERNAME}

invoke-command -computername amereid4 {$var = 10}  heto invoke-command -computername amereid4 {$var}  chi perer 10 qani invoke commnad e start session runs and then ends session

Invoke-Command -ComputerName amereid4 -ScriptBlock {Get-EventLog -LogName security} | Select-Object -First 10    it will work but a bad example 

Invoke-Command -ComputerName amereid4 -ScriptBlock {Get-EventLog -LogName security} | gm    to see what am i getting back

Invoke-Command -ComputerName amereid4 -ScriptBlock {Get-EventLog -LogName security | select-object -first 10 }  thins way all the process is done in remote only the first 10 is serialized and sent back

even batter one  there is              Invoke-Command -ComputerName amereid4 -ScriptBlock {Get-EventLog -LogName security -newest 10 }

Invoke-Command -ComputerName amereid4 -ScriptBlock {Get-process}

to see what am i getting (we see that we dont get any of the methods that when we do it localy we get)      Invoke-Command -ComputerName amereid4 -ScriptBlock {Get-process} | gm


invoke-command -computername amereid4 -scriptblock {get-process} | where {$_.name -eq "notepad"}    example to get notepad process


measure-command {invoke-command -computername amereid4 -scriptblock {get-process} | where {$_.name -eq "notepad"} }   to see how long it takes  THIS ONE 10 SEC


measure-command {invoke-command -computername amereid4 -scriptblock {get-process | where {$_.name -eq "notepad"} } }  this one takes 1 sec  

invoke-command -computername amereid4 -scriptblock {get-process | where {$_.name -eq "notepad"} | stop-process }    whatever you need to do should do on remote side .

$session = New-PSSession -ComputerName amereid4       i created a session 

get-pssession    to see what seesion do i have 

invoke-command -session $session {$var=10}          added a value in amereid4
invoke-command -session $session {$var}             we will see that it will bring 10 value cause we have open session it is not closing 

$session | remove-pssession   to close the session that we have 

$session = "amereid4" , "amerecd1"    to assign multiple hostnames
$session       to see whats in it .

Invoke-Command -ComputerName $session -ScriptBlock {$env:COMPUTERNAME}    to check for examples hostnames on the $session

$remotesession = new-pssession -computername $ session       this means $session names are created multiple sessions

$remotesession     to see what session i have

 Invoke-Command -Session $remotesession -ScriptBlock {$env:COMPUTERNAME}

$remotesession[0]    to see the first one  ,cause array starts at 0 line 

Enter-PSSession -Session $remotesession[0]    one of examples on how to enter remote session 

$remotesession | Remove-PSSession     to remove only from variables

Import-Module activedirectory    

$address = New-PSSession -ComputerName amereid4   
then 
Import-Module -name ActiveDirectory -PSSession $address    to import a module from a hostname

get-command -Module activedirectory  to see my command in activedirectory 

$c = get-command get-aduser
$c.defenition  to see what it is doing 
Get-ADUser -Filter * | gm    to see what we can work with parameters .


$comm = "get-process"     it will not run it if you do 
$comm     it will show diplay    get-process
&$comm     like this if you add &  it will run  (so &  is the excecution operator )


remove-module activedirectory
Import-Module -name ActiveDirectory -PSSession $address -Prefix OnDC    this whay it will add OnDC to active directory functions (like this when working on multiple computer you will be able to diffrentiate with hostname DC was )

Get-Module -ListAvailable -SkipEditionCheck

  Install-Module windowscompatibility -Scope currentuser     to use all powershell modules also

Import-WinModule .microsoft.powershell.management 
get-eventlog

get-eventlog -newest 5 -logname security

$c = get-command get-eventlog
$c

Get-WinEvent -logname security -maxevents 5

Get-PSSessionConfiguration

 $sess = New-PSSession -Name DC1sess -ComputerName amereid4
 Get-PSSession
Invoke-Command -Session $sess {$var=50}
Disconnect-PSSession -Id 1      it is disconnected but the session is still available in amereid4 that why when you reconnect and get $var  it will display 
Connect-PSSession -id 1
Invoke-Command -Session $sess {$var}
$sess | Remove-PSSession


Enter-PSSession amereid4
Invoke-Command -ComputerName amerecd1 {get-host}    it wiill not get cause from a remote you cannot use ur credentials to another remote , need to use -credentials

cd wsman:
cd .\localhost\client\auth
ls     to see CredSSP is true to use this instead of kerberos
Or you can create a GP to allow    CredDelegate   allow delegating fresh credentials    *.saviltech.net
Enter-PSSession amereid4 -Authentication Credssp -Credential (Get-Credential)
Enter-PSSession amereid4.savilltech.net -Authentication Credssp -Credential (Get-Credential)
From Active directory on the server or PC there is delegation  tab . trust this comp (kerberos only )

cd wsman:
cd.localhost\client
ls
set-item -path .\trustedhost -value ''   blank or
set-item -path .\trustedhost -value '10.200.246.33'  or
set-item -path .\trustedhost -value '*.savilltech.net'
set-item -path .\trustedhost -value '*'   #very bad!



import-module PSDiagnostics
Get-command -module PSDiagnostics
Enable-pswsmancombinedtrace
invoke-command -computername comp1 -scriptblock {get-process}
Disable-pswsmancombinedtrace

to see the sertificates to enable http with ssl
cd cert:
Get-PSDrive
 cd \LocalMachine\
cd my
ls


winrm enumerate winrm/config/listener


#Connection via SSH  hostname instead of computername
Invoke-Command -HostName savazuussclnx01 -ScriptBlock {get-process} -UserName john


New-PSSession -ComputerName savazuusscds01  #winrm
New-PSSession -HostName savazuussclnx01 -UserName john
Get-PSSession -OutVariable sess    or $sess = get-pssession
$sess
invoke-command $sess {get-process *s}
$sess | Remove-PSSession



