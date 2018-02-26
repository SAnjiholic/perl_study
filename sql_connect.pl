use DBI;

####################################################################
# DB connect
my $dbs = "dbi:ODBC:driver={SQL Server};database='database name";server="serverip"";
my ($username, $password) = ('id', 'password');
my $dbh = DBI ->connect($dbs, $username, $password);
####################################################################

#Create table
$sql_create = << 'END_SQL'; 
create table "table_name"(
	
	id			INT PRIMARY KEY,
	name		VARCHAR(20),
	password	VARCHAR(20)

)
END_SQL
$dbh->do($sql_create);
####################################################################

####################################################################

#insert date
$dbh->do('INSERT INTO "table_name" (field) VALUES (?,?...)',
  undef,
  first_?,
  second_?....);

####################################################################

#update data

$dbh->do('update "table_name" SET field = ? where field = ?',
	undef,
	first_?,second_?....)

####################################################################


#select

my $sql = 'SELECT field FROM table_name WHERE field > ? AND field < ?';
my $sth = $dbh->prepare($sql);
$sth->execute(1, 10);
while (my @row = $sth->fetchrow_array) {
   print "first_field: $row[0]  second_field: $row[1]\n";
}
 
or 

$sth->excute(1, 10);
while (my $row = $sth->fetchrow_hashref) {
	print"first_field: $row->{first_field} second_field: $row->{second_field}\n";
}

# fetchrow_array => return list
# fetchrow_hashref => retrun hash Reference

####################################################################


