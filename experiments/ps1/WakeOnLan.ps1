# nice it works
$Mac = "1A:2B:3C:4D:5E:6F"

# https://www.pdq.com/blog/wake-on-lan-wol-magic-packet-powershell/
# Converts mac to udp bytes
$MacByteArray = $Mac -split "[:-]" | ForEach-Object { [Byte] "0x$_"}
[Byte[]] $MagicPacket = (,0xFF * 6) + ($MacByteArray  * 16)

# Function To test
$UdpClient = New-Object System.Net.Sockets.UdpClient
$UdpClient.Connect(([System.Net.IPAddress]::Broadcast),7)
$UdpClient.Send($MagicPacket,$MagicPacket.Length)
$UdpClient.Close()

