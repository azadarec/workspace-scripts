param($remote_host="127.0.0.1", $fan_count=6, $max="75")
$user="administrator"
$pw=""


for($i = 0; $i -lt $fan_count; ++$i) {
    Write-Host "fan p ${i} "
    ssh $user@$remote_host "fan p ${i} max ${max}"
}