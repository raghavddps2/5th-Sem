# Program 3: Simulate a four-node point-to-point network, and connect the links as follows:
# n0->n2, n1->n2 and n2->n3. Apply TCP agent changing the parameters and determine the
# number of packets sent/received by TCP/UDP

set ns [new Simulator]

set namFile [open 3.nam w]
$ns namtrace-all $namFile

set traceFile [open 3.tr w]
$ns trace-all $traceFile


proc finish {} {

    global ns namFile traceFile
    $ns flush-trace

    close $namFile
    close $traceFile

    exec awk -f 3.awk 3.tr &
    exec nam 3.nam &
    exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

$n0 color red
$n1 color blue
$n2 color orange
$n3 color purple

$ns color 1 blue

$n0 label TCP
$n1 label UDP
$n3 label NULL-TCPSink

$ns duplex-link $n0 $n2 1Mb 10ms DropTail
$ns duplex-link $n1 $n2 1Mb 10ms DropTail
$ns duplex-link $n2 $n3 500Kb 10ms DropTail


#This is between 0 and 3
set tcp0 [new Agent/TCP]
$ns attach-agent $n0 $tcp0

set sink0 [new Agent/TCPSink]
$ns attach-agent $n3 $sink0
$ns connect $tcp0 $sink0
$tcp0 set fid_ 1

#Thiis generatees the traffic here.
set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0

#This is between 1 and 3.
set udp0 [new Agent/UDP]
$ns attach-agent $n1 $udp0

set null0 [new Agent/Null]
$ns attach-agent $n3 $null0
$ns connect $udp0 $null0

#This generatees the traffic here.
set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 500
$cbr0 set interval_ 0.005
$cbr0 attach-agent $udp0

$ns at 0.1 "$ftp0 start"
$ns at 0.2 "$cbr0 start"
$ns at 4.1 "$ftp0 stop"
$ns at 4.2 "$cbr0 stop"
$ns at 4.5 "finish"
$ns run