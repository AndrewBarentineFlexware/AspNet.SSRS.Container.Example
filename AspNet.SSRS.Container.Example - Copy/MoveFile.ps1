#echo "Install fonts"
#$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
#foreach ($file in gci *.ttf)
#{
#    $fileName = $file.Name
#    if (-not(Test-Path -Path "C:\Windows\fonts\$fileName" )) {
#		$ShellFile = $fonts.ParseName($fileName)
#		$RegName = $ShellFolder.GetDetailsOf($ShellFile, 21) + ' ' + '(TrueType)'
#		New-ItemProperty -Name $RegName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $fileName -Force | out-null
#        echo $fileName
#        dir $file | %{ $fonts.CopyHere($_.fullname) }
#    }
#}
#cp *.ttf c:\windows\fonts\

echo "Install fonts"
$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
foreach ($file in gci *.ttf)
{
    $fileName = $file.Name
    if (-not(Test-Path -Path "C:\Windows\fonts\$fileName" )) {
        echo $fileName
        dir $file | %{ $fonts.CopyHere($_.fullname) }
    }
}
cp *.ttf c:\windows\fonts\