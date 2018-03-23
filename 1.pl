$clear_string = `clear`;

while(1){
print $clear_string
}
$SIG{INT} = sub { 
	print "Received SIGINT\n";
	exit(1);}
