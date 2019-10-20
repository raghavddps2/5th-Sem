# Simulate a four-node point-to-point network, and connect the links as follows: n0->n2,  n1->n2  and  n2->n3. 
# Aply  TCP  agent  changing  the  parameters  and determine the number of packets sent/received by TCP/UDP


#Create a simulator object.
set ns [new Simulator]

#set up trace files.
set traceFile [open 3.tr w]
$ns trace-all $traceFile

#set up nam files.
set namFile [open 3.nam w]
$ns namtrace-all $namFile

proc finish {} {
    global ns traceFile namFile
    $ns flush-trace 
    #This is to flush the trace.

    close $traceFile
    close $namFile

    exec awk -f stats.awk 3.tr &
    exec nam 3.nam &
    exit 0
}

# Now, let us create the 4 nodes.
for {set i 0} {$i < 4} {incr i} {
    set n($i) [$ns node]
}

#We need to set up the links.
$ns duplex-link $n(0) $n(2) 2Mb 10ms DropTail
$ns duplex-link $n(1) $n(2) 2Mb 10ms DropTail
$ns duplex-link $n(2) $n(3) 100kb 10ms DropTail

#Set the queue size.
$ns queue-limit $n(0) $n(2) 10 
$ns queue-limit $n(1) $n(2) 10

#Lets setup TCP connection between 0 and 3. 

set tcp [new Agent/TCP]
$ns attach-agent $n(0) $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n(3) $sink
$ns connect $tcp $sink

#Now, lets attach an FTP Application over TCP (Generate the traffic.)
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ftp set type_ FTP

# Lets setup UDP connection between node 1 and node 3.
set udp [new Agent/UDP]
$ns attach-agent $n(1) $udp
set null [new Agent/Null]
$ns attach-agent $n(3) $null
$ns connect $udp $null

#Now, lets attch a CBR traffic over the UDP protocol.
set cbr [new Application/Traffic/CBR]
$cbr set packetSize_ 500
$cbr set interval_ 0.005
$cbr attach-agent $udp

#Schedule events.
$ns at 0.5 "$ftp start"
$ns at 1.0 "$cbr start"

$ns at 9.0 "$cbr stop"
$ns at 9.5 "$ftp stop"
$ns at 10.0 "finish"

#Run simulation
$ns run