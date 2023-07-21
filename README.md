# x86 PowerShell Memory Injection Script
A simple, obfuscated in-memory injection script written in PowerShell that bypasses Windows Defender (according to the time of writing this). Works only by using the x86 version of PowerShell

## Disclaimer
⚠️ This code won't be used for illegal purposes. Use it responsibly for education only

## Usage
First, make sure you have ExecutionPolicy set to "Unrestricted"
```
Get-ExecutionPolicy -Scope CurrentUser
```
If not, set it like this
```
Set-ExecutionPolicy Unrestricted -Scope CurrentUser
```
Then, run your script while opening PowerShell x86 by simply:
```
.\code.ps1
```
ℹ️ Don't forget to edit the "shellcode goes here" placeholder to your own custom shellcode or to a msfvenom payload
