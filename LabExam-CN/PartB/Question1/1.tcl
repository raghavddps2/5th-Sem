set ns [new Simulator]

set namFile [open 1.nam w]
set traceFile [open 1.tr w]

$ns trace-all $traceFile
$ns namtrace-all $namFile

proc finish {} {

    global ns namFile traceFile

    $ns flush-trace

    close $namFile
    close $traceFile

    exec awk -f 1.awk 1.tr &
    exec nam 1.nam &
    exit 0
}
# Always remember, you should write $ns node.
set n0 [$ns node] 
set n1 [$ns node]
set n2 [$ns node]

$ns duplex-link $n0 $n1 1.0Mb 10ms DropTail
$ns duplex-link $n1 $n2 1.0Mb 10ms DropTail
$ns queue-limit $n0 $n1 10
$ns queue-limit $n1 $n2 10

set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0

set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 512
$cbr0 set interval_ 0.005
#Don't forget the set word here.
$cbr0 attach-agent $udp0

set sink [new Agent/Null]
$ns attach-agent $n2 $sink

$ns connect $udp0 $sink

$ns at 0.2 "$cbr0 start"
$ns at 4.0 "$cbr0 stop"
$ns at 4.5 "finish"
$ns run