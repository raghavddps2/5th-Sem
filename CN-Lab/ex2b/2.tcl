# Simulate the different types of internet traffic such as FTP and TELNET over network and 
# analyze the throughput 

#Create a simulator object.
set ns [new Simulator]

#set up trace files and the nam files.
set traceFile [open 2.tr w]
$ns trace-all $traceFile

set namFile [open 2.nam w]
$ns namtrace-all $namFile

proc finish {} {
    global ns traceFile namFile
    $ns flush-trace

    #close the nam and the trace files.
    close $namFile
    close $traceFile

    exec awk -f stats.awk 2.tr &
    exec nam 2.nam &
    exit 0
}

#Now, we need to create 4 nodes. Let us use, loops this time.
for {set i 0} {$i < 4} {incr i} {
    set n($i) [$ns node]
}

#Create duplex links between nodes.
$ns duplex-link $n(0) $n(2) 2Mb 10ms DropTail
$ns duplex-link $n(2) $n(3) 500kb 10ms DropTail
$ns duplex-link $n(1) $n(2) 2Mb 10ms DropTail

#Set the queue size, setting between node 0 and node 2.
$ns queue-limit $n(0) $n(2) 10 


#Set TCP Telnet connection between n(0) and n(3)
set tcp0 [new Agent/TCP]
$ns attach-agent $n(0) $tcp0
set sink0 [new Agent/TCPSink]
$ns attach-agent $n(3) $sink0
$ns connect $tcp0 $sink0

#Attaching the TELNET Application over TCP.
set telnet [new Application/Telnet]
$telnet attach-agent $tcp0
$telnet set interval_ 0

#Set TCP connection between n(1) and n(3) 
set tcp1 [new Agent/TCP]
$ns attach-agent $n(1) $tcp1
set sink1 [new Agent/TCPSink]
$ns attach-agent $n(3) $sink1
$ns connect $tcp1 $sink1

#Attaching the TELNET Application over TCP.
set ftp [new Application/FTP]
$ftp attach-agent $tcp1
$ftp set type_ FTP

#scheduling events
$ns at 0.5 "$telnet start"
$ns at 0.6 "$ftp start"
$ns at 24.5 "$telnet stop"
$ns at 24.5 "$ftp stop"
$ns at 25.0 "finish"

#Run simulation
$ns run
