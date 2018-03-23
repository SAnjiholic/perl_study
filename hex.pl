#!/usr/bin/perl

die "Input File name \n" if $#ARGV == -1;
my ($offset,$address,$line);
my ($buf16, $buf16Len, @buf16Array, $output, @Leng);
my $cls = `clear`;
	while(1){

		$line = 0;
		@Leng = ();
		$SIG{'INT'} = \&interrupt;
		print $cls;
		open(IN, "<", $ARGV[0]) or die "$!\n";
		binmode(IN);

		while ($buf16Len = read(IN, $buf16, 16)) {
			$output = sprintf("%08X:  ", $offset);
			@buf16Array = unpack "C*", $buf16;

			for (my $i = 0; $i < $buf16Len; $i++) {
				$output .= " " if ($i == 8);
				$output .= sprintf("%02X ", $buf16Array[$i]);
			}
			for (my $i = 0; $i <= (16 - $buf16Len) * 3; $i++) { $output .= " "; }
			$output .= " " if ($buf16Len < 9);

			for (my $i = 0; $i < $buf16Len; $i++) {
				if ($buf16Array[$i] >= 0x20 && $buf16Array[$i] <= 0x7E) {
					$output .= sprintf("%c", $buf16Array[$i]);

				} else { $output .= "."; }
			}

			$offset += 16;
			if($line > 65){last;}
			if ($address < $offset){
				push (@Leng,$output);
				$line++;
			}	
		}
		printf("%08X:  ", $offset) if ($offset == 0);
		close IN;
		foreach(@Leng){
			print;
			print "\n";
		}
		sleep 1;
		print $cls
			$offset = 0;
	}

sub interrupt{
	my $num;
	print "Goto Address : ";
	chomp($num = <STDIN>); 
	$address = hex($num);
}

