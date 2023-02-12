Set-Location $env:LOCALAPPDATA/temp


$directories = Get-ChildItem | Where-Object { $_.PSisContainer} 

for($i = 0; $i -lt $directories.length; $i++ ) {
    if(
        (
            $directories[$i].Name.StartsWith("jetty") -or 
            $directories[$i].Name.StartsWith("flutter") -or
            $directories[$i].Name.StartsWith("chrome")
        )
        
    ) {
        Remove-Item $directories[$i] -Recurse
    }
}