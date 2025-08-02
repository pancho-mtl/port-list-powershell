# Get TCP connections
$connections = Get-NetTCPConnection -State Listen

# Process each connection
$grouped = $connections | Sort-Object LocalPort | ForEach-Object {
$proc = Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue

    [PSCustomObject]@{
        Protocolo   = "TCP"
        Port        = $_.LocalPort
        Address     = $_.LocalAddress
        Process     = if ($proc) { $proc.ProcessName } else { 'Unknown (PID: ' + $($_.OwningProcess) + ')' }
        PID         = $_.OwningProcess
    }
}

# Display results
$grouped | Sort-Object Protocol, Port | Format-Table -AutoSize
