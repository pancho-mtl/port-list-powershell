# Get UDP connections
$udp = Get-NetUDPEndpoint | ForEach-Object {

# Get the process associated with the UDP endpoint
$proc = Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue

    [PSCustomObject]@{
        Protocol = "UDP"
        Port    = $_.LocalPort
        Address = $_.LocalAddress
        Process   = if ($proc) { $proc.ProcessName } else { 'Unknown (PID: ' + $($_.OwningProcess) + ')' }
        PID       = $_.OwningProcess
    }
}

# Display results
$udp | Sort-Object Protocol, Port | Format-Table -AutoSize
