die "Insert File name\n" if $#ARGV == -1;
my $chkren = @ARGV[1];
my $size;
my $offset;
my %address = ();
my %radr = ();

open(IN, "<", $ARGV[0]) or die "$!\n";	 
binmode(IN);
while ($buf16Len = read(IN, $buf16, 51020402)) {
	@buf16Array = unpack "C*", $buf16;
	$chkren = 3	if ($chkren == 0);
	$offset = 0x00;
	for (my $i = 0; $i < $buf16Len; $i++) {
		$count = $i % 16;
		$offset += 0x10 if $count == 0 & $i != 0;
		if ($buf16Array[$i] > 32 & $buf16Array[$i] < 126) {
			$tmp_ren .= chr($buf16Array[$i]); $flag++;
			}
		else {
			if($flag >= $chkren){
				$tmp_ren .= "\n"; push @ren, $tmp_ren;
				$address{$offset} = $tmp_ren;
				$radr{$offset+$count} = $tmp_ren;
				$tmp_ren = ""; }
			else{
				$tmp_ren ="";}
			$flag = 0;
			}
		}
	$count++;
	$size = $offset + $count;
	}
close IN;

#foreach(@ren){print;}
#$offset = sprintf "%x",$offset;
#printf("%08x  ",$offset);
#print "$size byte\n";
}

