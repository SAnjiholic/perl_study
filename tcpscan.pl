use IO::Socket;
$| = 1;
print "Enter Target/hostname : "; 
chop ($target = <stdin>);
print "Start Port : ";
chop ($start_port = <stdin>);
print "End Port : ";
chop ($end_port = <stdin>);
foreach ($port = $start_port ; $port <= $end_port ; $port++) 
{
    print "\rScanning port $port";
    $socket = IO::Socket::INET->new(PeerAddr => $target , PeerPort => $port , Proto => 'tcp' , Timeout => 0.1);
    if( $socket )
    {
        print "\r = Port $port is open.\n" ;
    }
    else
    {
    }} 
print "\n\nFinished Scanning $target\n";
exit (0);
