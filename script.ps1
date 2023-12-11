$file = ".\LC.zip"
$path = "C:\Program Files (x86)\Steam\steamapps\common"
$mods = ".\Lethal Company"

iwr 'https://github.com/uffemcev/LC/releases/download/LC/LC.zip' -Useb -OutFile '.\LC.zip'

Remove-Item -Recurse -Force -ErrorAction 0 "$path\Lethal Company\BepInEx"
Expand-Archive -ErrorAction 0 -Force $file $mods
Copy-Item $mods $path -Recurse -Force

Remove-Item -Recurse -Force -ErrorAction 0 $file
Remove-Item -Recurse -Force -ErrorAction 0 $mods
