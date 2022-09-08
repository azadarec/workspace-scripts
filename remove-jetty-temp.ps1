Set-Location $env:LOCALAPPDATA/temp


$directories = Get-ChildItem | Where-Object { $_.PSisContainer} 

for($i = 0; $i -lt $directories.length; $i++ ) {
    if($directories[$i].Name.StartsWith("jetty")) {
        Remove-Item $directories[$i] -Recurse
    }
}