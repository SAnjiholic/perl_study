#&interrupt;
my $tmp = 1;
my $cls = `clear`;
while(1){
	$SIG{'INT'} = \&interrupt;
	print "$tmp\n";
	sleep 1;
}
sub interrupt{
	print $cls;
	print "interrupt!!\n";
	$tmp = <STDIN>;
}
