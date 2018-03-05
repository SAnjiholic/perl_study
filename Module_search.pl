my @modules; 
my @inc = &inc;
$check_flag = 0;
$aad = 0;
@now_mod;
$now_mod;
@tt = split(/\\/,$ARGV[0]);
@tt = split(/\//,$ARGV[0]) unless $tt[0];
$now_mod = $tt[-1];
print $now_mod."\n";

modules_name($ARGV[0]);

sub modules_name{
	my $name = shift;
	my $name2 = shift;
	my @tra = split "/",$name;
	my $name_real = $tra[-1];
	unshift(@now_mod,$name_real);
	$now_mod = $now_mod[0];
	$now_mod = $tt[-1] unless ($now_mod);
	open (F,$name);	my @files = <F>; close(F);
	foreach (@files) {
		if(/^use /){
			s/^use | |;|\n//g;
			s/qw.*|//g;
			s/\(.*//g;
			my @tmp = split " "; next if ($tmp[3]);

			unless (/strict/|/warnings/|/vars/|	/5.*/|/constant/|/Encode/) {				
			push(@modules,$_);	$aad++;
			

			modules_find($modules[-1],$now_mod);
			}}
		elsif(/__END__/ ){last;}
	}
	#$now_mod = undef;
	$now_mod = $tt[-1];
}

sub modules_find{ 
	my $mod_name = $_ if ($_ | "");
	print "$aad : use ";
	print $mod_name if ($_);
	print " \($now_mod => $mod_name) " if ($now_mod);
	print "\n";
	s/::/\//g;
	
	$pm_flag = substr $mod_name, -2;
	#$pm_flag = substr $mod_name, -2;
	$mod_name .=".pm" unless ($mod_name eq "pm");		
	foreach (@inc) {
		$where = $_.$mod_name;
		#print $where." ";
		#print "$mod_name\n" if ($_);
		if (-f $where) {
			modules_name($where,$_);
			}
		elsif ($check_flag) {last;}
		else {last;}
	}
}
sub inc{
	$flag; $number;	@lib;
	@a = `perl -V`;	
	foreach (@a) {
		if ($flag) {
			s/ |\n//g;
			$lib[$number] = $_."/";
			$number++;	 
			}
		$flag = 1 if (/\@INC/)
	}
	return @lib; 
}