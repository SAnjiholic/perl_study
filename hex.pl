#!/usr/bin/perl

die "파일명을 입력하세요\n" if $#ARGV == -1;
my $offset = 0; # 번지 변수
my ($buf16, $buf16Len, @buf16Array, $output, @Leng);

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
	push (@Leng,$output);
}
printf("%08X:  ", $offset) if ($offset == 0);
close IN;
foreach(@Leng){
	print;
	print "\n";
};

