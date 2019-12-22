set ns [new Simulator]

set traceFile [open 2.tr w]
set namFile [open 2.nam w]

$ns trace-all $traceFile
$ns namtrace-all $namFile

proc finish {} {

    global ns traceFile namFile
    $ns flush-trace
    close $traceFile
    close $namFile

    exec awk -f 2.awk 2.tr &
    exec nam 2.nam &
    exit 0 
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

$ns duplex-link $n0 $n2 2Mb 10ms DropTail
$ns duplex-link $n1 $n2 2Mb 10ms DropTail
# THe bw to be changed here.
$ns simplex-link $n3 $n2 500Kb 10ms DropTail  --
$ns simplex-link $n2 $n3 500Kb 10ms DropTail


$ns queue-limit $n0 $n2 10
$ns simplex-link-op $n0 $n2 queuePos 0.5

#Setting up a tcp connection between n0 and n3. And applying the FTP Packet.
set tcp0 [new Agent/TCP]
$ns attach-agent $n0 $tcp0

set sink0 [new Agent/TCPSink]
$ns attach-agent $n3 $sink0

$ns connect $tcp0 $sink0
$tcp0 set fid_ 1

set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0
$ftp0 set type_ FTP

#Setting up a tcp connection between n1 and n3
set tcp1 [new Agent/TCP]
$ns attach-agent $n1 $tcp1

set sink1 [new Agent/TCPSink]
$ns attach-agent $n3 $sink1

$ns connect $tcp1 $sink1
$tcp1 set fid_ 2

set telnet0 [new Application/Telnet]
$telnet0 attach-agent $tcp1
$telnet0 set type_ Telnet

$ns at 0.5 "$telnet0 start"
$ns at 0.5 "$ftp0 start"
$ns at 24.5 "$telnet0 stop"
$ns at 24.5 "$ftp0 stop"
$ns at 25.0 "finish"

$ns run
