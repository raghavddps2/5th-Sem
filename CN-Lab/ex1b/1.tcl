# Simulate three nodes point-to-point networks with duplex links between them. 
# Set  the  queue  size  and  vary  the  bandwidth  and  find  the  number  of  packets dropped.

#Create a Simulator object.
set ns [new Simulator]

$ns color 2 red

#Tell the simulator to ue static routing.
$ns rtproto Static

#Set up trace files.
set traceFile [open 1.tr w]
$ns trace-all $traceFile

#Set up nam files.
set namFile [open 1.nam w]
$ns namtrace-all $namFile

proc finish {} {
    #declaring them as globall variables.
        global ns namFile traceFile
    $ns flush-trace

    #Close the trace files.
    close $traceFile
    close $namFile
    #Exceute the awk file and the name files and exit with code 0.
        exec awk -f stats.awk 1.tr &
        exec nam 1.nam &
        exit 0
}

#Setup 3 nodes.
set n(1) [$ns node]
set n(2) [$ns node]
set n(3) [$ns node]

#Setup duplex links.
$ns duplex-link $n(1) $n(2) 1.0Mb 20ms DropTail
$ns duplex-link $n(2) $n(3) 1.0Mb 20ms DropTail
$ns queue-limit $n(1) $n(2) 10
$ns queue-limit $n(2) $n(3) 10

#If i increase the queue length soooo much, nothing will happen as the packets will be in the queue as the queue size is more than generated packets.

#Setting up aesthetics for the nodes.
$n(1) shape hexagon
$n(1) color red

$n(3) shape square
$n(3) color blue

#Create a UDP agent and attach it to node 1.
set udp0 [new Agent/UDP]
$ns attach-agent $n(1) $udp0

#We need to generate the traffic that is CBR, and attach it to the transmission prototcol, that is UDP.
set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 512
$cbr0 set interval_ 0.005
$cbr0 attach-agent $udp0

#Create a null agent(Sink) and attahc it to node 3
set null0 [new Agent/Null]
$ns attach-agent $n(3) $null0

#We need to connect the traffic source with the traffic sink color and assign it a flow id color.
$ns connect $udp0 $null0
$udp0 set fid_ 2

#Simulation events.
$ns at 0.2 "$cbr0 start"
$ns at 2.0 "$cbr0 stop"
$ns at 2.0 "finish"

#Run the simulation
$ns run