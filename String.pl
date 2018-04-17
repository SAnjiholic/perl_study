die "Insert File name\n" if $#ARGV == -1;
my $chkren = @ARGV[1];
my $size = -s $ARGV[0];
open(IN, "<", $ARGV[0]) or die "$!\n";	 
binmode(IN);
while ($buf16Len = read(IN, $buf16, $size)) {
	@buf16Array = unpack "C*", $buf16;
	$chkren = 3	if ($chkren == 0);
	for (my $i = 0; $i < $buf16Len; $i++) {
		if ($buf16Array[$i] > 32 & $buf16Array[$i] < 126) {
			$tmp_ren .= chr($buf16Array[$i]); $flag++;
			}
		else {
			if($flag >= $chkren){
				$tmp_ren .= "\n"; push @ren, $tmp_ren; $tmp_ren = ""; }
			else{
				$tmp_ren ="";}
			$flag = 0;
			}
		}
	}
close IN;
foreach(@ren){print;}
