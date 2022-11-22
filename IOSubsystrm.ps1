clear
$serverName = "severname"
$Counters = @(
   ("\\$serverName" +"\PhysicalDisk(*)\Disk Bytes/sec"),
   ("\\$serverName" +"\PhysicalDisk(*)\Disk Read Bytes/sec"),
   ("\\$serverName" +"\PhysicalDisk(*)\Disk Write Bytes/sec")
   )
Get-Counter -Counter $Counters -SampleInterval 2 -MaxSamples 20 | ForEach-Object  {
$_.CounterSamples | ForEach-Object 	  {
   [pscustomobject]@{
      TimeStamp = $_.TimeStamp
      Path = $_.Path
      Value = ([Math]::Round($_.CookedValue, 3))
}
}
}