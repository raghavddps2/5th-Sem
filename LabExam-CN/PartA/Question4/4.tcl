#Setting uup the simulator object
set ns [new Simulator]

set traceFile [open 4.tr w]
$ns trace-all $traceFile

set namFile [open 4.nam w]
$ns namtrace-all $namFile

#DEfining the finish procedure
proc finish {} {

    global ns traceFile namFile
    
    $ns flush-trace
    close $traceFile
    close $namFile

    exec awk -f 4.awk 4.tr &
    exec nam 4.nam &
    exit 0
}

#Creating all the nodes.
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]


#Setting up the duplex links between 0 and other nodes.
$ns duplex-link $n1 $n0 2Mb 10ms DropTail
$ns duplex-link $n2 $n0 2Mb 10ms DropTail
$ns duplex-link $n3 $n0 2Mb 10ms DropTail
$ns duplex-link $n4 $n0 2Mb 10ms DropTail
$ns duplex-link $n5 $n0 2Mb 10ms DropTail
$ns duplex-link $n6 $n0 2Mb 10ms DropTail


Agent/Ping instproc recv {from rtt} {
    $self instvar node_
    puts "node [$node_ id] received ping answer from $from with a roound trip time of $rtt ms"
}
#Creating the ping agents.
set p1 [new Agent/Ping]
set p2 [new Agent/Ping]
set p3 [new Agent/Ping]
set p4 [new Agent/Ping]
set p5 [new Agent/Ping]
set p6 [new Agent/Ping]


# Attaching each agent to each node.
$ns attach-agent $n1 $p1
$ns attach-agent $n2 $p2
$ns attach-agent $n3 $p3
$ns attach-agent $n4 $p4
$ns attach-agent $n5 $p5
$ns attach-agent $n6 $p6

#Connecting the ping agents.
$ns connect $p1 $p4
$ns connect $p2 $p5
$ns connect $p3 $p6

# $Have to set queue limits for one side
$ns queue-limit $n0 $n4 3
$ns queue-limit $n0 $n5 0
$ns queue-limit $n0 $n6 1

$ns at 0.0 "$p1 send"
$ns at 0.4 "$p2 send"
$ns at 0.8 "$p3 send"
$ns at 1.2 "$p4 send"
$ns at 1.6 "$p5 send"
$ns at 2.0 "$p6 send"
$ns at 2.5 "finish"

$ns run