# Simulate   the   transmission   of   ping   messages   over   a   network   topology 
# consisting  of  6  nodes  and  find  the  number  of  packets  dropped  due  to congestion.

set ns [new Simulator]

#setup the trace and the nam files.
set traceFile [open 4.tr w]
$ns trace-all $traceFile

set namFile [open 4.nam w]
$ns namtrace-all $namFile

proc finish {} {
    global ns traceFile namFile
    $ns flush-trace

    close $namFile
    close $traceFile
    exec awk -f stats.awk 4.tr &
    exec nam 4.nam &
    exit 0
}

# Creating 6 nodes.
for {set i 0} {$i < 7} {incr i} {
    set n($i) [$ns node]
}

#creating links between them.
for {set i 1} {$i < 4} {incr i} {
    $ns duplex-link $n($i) $n(0) 1Mb 10ms DropTail
}

$ns duplex-link $n(4) $n(0) 1Mb 100ms DropTail
$ns duplex-link $n(5) $n(0) 1Mb 100ms DropTail
$ns duplex-link $n(6) $n(0) 1Mb 90ms DropTail

#Here, the word instproc is basically used to tell the menber function of the class.
# $self basically acts as the self or this in java or python.
Agent/Ping instproc recv {from rtt} {
    #instvar to tell tht variable of instproc or menber function.
    $self instvar node_ 
    #class variables.
    puts "node [$node_ id] received ping from \
        $from with round-trip time $rtt ms."
}

#create ping agents.
for {set i 1} {$i < 7} {incr i} {
    set pingAgent($i) [new Agent/Ping] 
    $ns attach-agent $n($i) $pingAgent($i)
}

#set the queue limits.
for {set i 1} {$i < 6} {incr i} {
    $ns queue-limit $n(0) $n($i) 2
}
$ns queue-limit $n(0) $n(6) 1

#NOw, lets connect 1 and 4, 2 and 5 and 3 and 6.
$ns connect $pingAgent(1) $pingAgent(4)
$ns connect $pingAgent(2) $pingAgent(5)
$ns connect $pingAgent(3) $pingAgent(6) 

#schedule the events.
$ns at 0.1 "$pingAgent(1) send"
$ns at 0.5 "$pingAgent(2) send"
$ns at 0.5 "$pingAgent(3) send"
$ns at 0.5 "$pingAgent(4) send"
$ns at 1.0 "$pingAgent(5) send"
$ns at 1.0 "$pingAgent(6) send"
$ns at 1.1 "$pingAgent(1) send"
$ns at 1.5 "$pingAgent(2) send"
$ns at 1.5 "$pingAgent(3) send"
$ns at 1.5 "$pingAgent(4) send"
$ns at 2.0 "$pingAgent(5) send"
$ns at 2.0 "$pingAgent(6) send"
$ns at 3.0 "finish"

#To run the simulation, simply the command
$ns run

