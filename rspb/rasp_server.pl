#!/usr/bin/perl

use DBI;

my $port = '3306';
my $driver ='mysql';
my $database ='test1';
my $member = '/code/tmp/member';
my $ftp = '/code/tmp/ftp';
my $ssh = '/code/tmp/ssh';
my $logdir = '/log/';
print 'insert host-address : ';chomp($hostname=<STDIN>);
print 'insert login user : ';chomp($user=<STDIN>);
print 'insert login pw : ' ;chomp($password=<STDIN>);

$dsn ="DBI:$driver:database=$database;host=$hostname;port=$port";
$dbh = DBI->connect($dsn, $user,$password) or  die "Got error $DBI::errstr when connecting to $dsn\n";

 

while(1){
my $sth = $dbh->prepare("SELECT * FROM member");
$sth->execute;
         
while ( my @row = $sth->fetchrow_array ) {
	
	
	
	if(@row[2]eq'ftp'){
		unless(-f "$ftp/@row[0]"){
		my $tftp ="$ftp/@row[0]";
		#print $tftp."\n";
		system("touch $tftp");
		open (FF ,">>$tftp");
		open (FFF,"$ftp/num");
		$num=<FFF>;
		close(FFF);
		#print $num."\n";
		print FF "@row[0]\n@row[1]\n$num\n";
		close (FF);
		open (FFF, ">$ftp/num");
		$num++;
		print FFF $num;
		close (FFF);

		&useradd(1,@row[0]);	
		}}
	
	elsif(@row[2]eq'ssh'){
		unless(-f "$ssh/@row[0]"){
		my $tssh ="$ssh/@row[0]";
		#print $tssh,"\n";
		system("touch $tssh");
		open (FF ,">>$tssh");
		open (FFF ,"$ssh/num");
		$num=<FFF>;
		close(FFF);
		#print $num."\n";
		print FF "@row[0]\n@row[1]\n$num\n";
		close(FF);
		open (FFF, ">$ssh/num");
		$num++;
		print FFF $num;	
		close(FFF);
		&useradd(2,@row[0]);
		}}

	}
sleep(5);
}

sub useradd{
	if (@_[0] ==1)
	{
		my $filedir = "$ftp/@_[1]";
		open (FF,"$filedir");
		my @a = <FF>;
		@a[0] =~ s/\n/ /g;
		@a[1] =~ s/\n/ /g;
		@a[2] =~ s/\n/ /g;	

		system("useradd  ".$a[0]." -d /SAnjiFTP/".$a[0]." -u ".@a[2]." -g 5000");
		system($a[0].":".$a[1]." chpasswd");
		system("mkdir /SAnjiFTP/".$a[0]);	

		
		$ftplog = $logdir."ftplog";
		open LOG,">>$ftplog";
		print LOG &now;
	       	print LOG $a[0]." joined\n";
		close LOG;	
		

	}
	elsif (@_[0] == 2)
	{
		#sshuseradd
	}
	}


	
	
sub now
	{
	my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime;
	$year = $year+1900;
	$now = $year."/".$mon."/".$mday." ".$hour.":".$min.":".$sec." ";
	}

