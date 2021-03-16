$path = "c:\testpath"
(Test-Path $path) ? "path exists" :"not found"
$path = "C:\Windows"
(Test-Path $path ) ? "path exists" : "not found"

Write-Output 'hello' && Write-Output 'world'
Write-Error 'hello' && Write-Output 'world'
Write-Error 'hello' || Write-Output 'world'
Write-Output 'hello' || Write-Output 'world'

$answer =$null
$answer ?? 42

$answer = "powershell"
$answer ?? 42

{Get-Module -ListAvailable AzureAD} ?? {Install-Module AzureAD}

$answer = $null
$answer ??= 42
$answer

$answer = "powershell"
$answer ??= 42
$answer

Start-Process notepad
$process = Get-Process -Name notepad
${process}?.id
Get-Process notepad | Stop-Process
$process = Get-Process -Name notepad
${process}?.Id

$number = 1..10
${number}?[0]
$number = $null
${number}?[0
]