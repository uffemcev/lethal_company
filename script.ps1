#ПРОВЕРКА ПРАВ
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
	try {Start-Process wt "powershell -ExecutionPolicy Bypass -Command &{cd '$pwd'\; $($MyInvocation.line -replace (";"),("\;"))}" -Verb RunAs}
	catch {Start-Process conhost "powershell -ExecutionPolicy Bypass -Command &{cd '$pwd'; $($MyInvocation.line)}" -Verb RunAs}
	(get-process | where MainWindowTitle -eq $host.ui.RawUI.WindowTitle).id | where {taskkill /PID $_}
}

#ЗНАЧЕНИЯ
$ProgressPreference = 'SilentlyContinue'
$file = ".\LC.zip"
$path = "C:\Program Files (x86)\Steam\steamapps\common"
$mods = ".\Lethal Company"

#СКАЧИВАНИЕ
iwr 'https://github.com/uffemcev/LC/releases/download/LC/LC.zip' -Useb -OutFile '.\LC.zip'

#УСТАНОВКА
Remove-Item -Recurse -Force -ErrorAction 0 "$path\Lethal Company\BepInEx"
Expand-Archive -ErrorAction 0 -Force $file $mods
Copy-Item $mods $path -Recurse -Force

#ОЧИСТКА
Remove-Item -Recurse -Force -ErrorAction 0 $file
Remove-Item -Recurse -Force -ErrorAction 0 $mods
