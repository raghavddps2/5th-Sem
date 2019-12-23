# Simulate an Ethernet LAN using n nodes and set multiple traffic nodes and
# determine collision across different nodes.


set ns [new Simulator]

$ns color 1 Blue
$ns color 2 Red

set traceFile [open 5.tr w]
set namFile [open 5.nam w]

$ns trace-all $traceFile
$ns namtrace-all $namFile

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]


# Specify color and shape for nodes
$n1 color Red
$n1 shape box
$n5 color Red
$n5 shape box
$n0 color Blue
$n4 color Blue

proc finish {} {

    global ns traceFile namFile

    $ns flush-trace

    close $traceFile
    close $namFile

    exec awk -f 5.awk 5.tr &
    exec nam 5.nam &
    exit 0
}

#First we setup the connections b4etween 0,1,2
$ns duplex-link $n0 $n2 2Mb 10ms DropTail
$ns duplex-link $n1 $n2 2Mb 10ms DropTail
$ns simplex-link $n2 $n3 0.3Mb 100ms DropTail
$ns simplex-link $n3 $n2 0.3Mb 100ms DropTail

#Now, we create a LAN of the remaining ones.
set lan [$ns newLan "$n3 $n4 $n5" 0.5Mb 40ms LL Queue/DropTail MAC/Csma/Cd Channel]

$ns duplex-link-op $n0 $n2 orient right-down
$ns duplex-link-op $n1 $n2 orient right-up
$ns simplex-link-op $n2 $n3 orient right
$ns simplex-link-op $n3 $n2 orient left


# 3Setting up between 0 and 4.
set tcp0 [new Agent/TCP/Newreno]
$ns attach-agent $n0 $tcp0

set sink0 [new Agent/TCPSink/DelAck]
$ns attach-agent $n4 $sink0
$ns connect $tcp0 $sink0
$tcp0 set fid_ 1
$tcp0 set packetSize 552

set ftp [new Application/FTP]
$ftp attach-agent $tcp0

#Setting up foor 1 and 5.
set udp0 [new Agent/UDP]
$ns attach-agent $n1 $udp0

set null0 [new Agent/Null]
$ns attach-agent $n1 $null0
$ns connect $udp0 $null0
$udp0 set fid_ 2

set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp0
$cbr0 set packetSize 1000 
$cbr0 set random_ false
$cbr0 set type_ CBR 
$cbr0 set rate_ 0.05Mb

$ns at 0.0 "$n0 label TCP_Traffic"
$ns at 0.0 "$n1 label UDP_Traffic"
$ns at 0.2 "$cbr0 start"
$ns at 0.3 "$ftp start"
$ns at 7.3 "$ftp stop"
$ns at 7.2 "$cbr0 stop"
$ns at 7.5 "finish"

$ns run

