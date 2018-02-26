use DBI;

my $port = '3306';
my $driver ='mysql';
my $database ='test1';


print 'insert host-address : ';chomp($hostname=<STDIN>);
print 'insert login user : ';chomp($user=<STDIN>);
print 'insert login pw : ' ;chomp($password=<STDIN>);


#--------------------------------------------------------------
$dsn ="DBI:$driver:database=$database;host=$hostname;port=$port";
$dbh = DBI->connect($dsn, $user,$password) or  die "Got error $DBI::errstr when connecting to $dsn\n";




print 'insert id : ';chomp($id=<STDIN>);
print 'insert pw : ';chomp($pw=<STDIN>);
print 'insert purpose (ssh or ftp): ';chomp($purpose=<STDIN>);



$sth= $dbh->prepare(q {insert into member values (?,?,?)});
$sth-> execute($id,$pw,$purpose) 