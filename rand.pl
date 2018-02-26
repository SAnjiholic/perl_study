use strict;
use warnings;
use Digest::MD5  qw(md5_hex);



sub randmd
{
my @rand;
my $flag1 = 0;
my $lop = 2;
my $ret;

while (1) {
	if($lop){
			$rand[$flag1] = int(rand(1000000));
			$lop--;
			$flag1++;}
	else{last;}}

$ret = $rand[0].$rand[1];

my $md5_hash = md5_hex($ret);
print "$ret\n";
print "$md5_hash\n";
}

