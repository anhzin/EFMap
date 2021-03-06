param(
    [string] $key
)

#try to get the first pack in your bins folder
#you are to supposed to have only one!

$pack = get-item bins\efmap*.*.nupkg 
if($pack -eq $null )
{
    write-host "no nuget package found in Bins folder, please run your build.ps1 file before to generate one"
}
else
{
    write-host "======================================================"
    write-host "Found [$($pack.name)] package ($($pack.length) bytes)"
    write-host "======================================================"
    write-host "pushing it to nuget gallery servers..."
    
    .\Tools\nuget.exe push "Bins\$($pack.name)" $key
    
}