package today;
use Moose;

has 'year' => (is => 'rw');
has 'month' => (is => 'rw');
has 'day' => (is => 'rw');


sub days{
	my ($self) = shift;
	my @d = qw/31 28 31 30 31 30 31 31 30 31 30 31/;
	my $i = $self->year;
	my $z =$i;
	my $j = $self->month;
	my $d = $self->day;
	my $ret;
	my $count=0;
	my $count2=0;
	my $num=0;

	
	if ($i < 20) {$i = $i+100;}
	$j--;
	$d--;

		

		while(1){

			if($j){
				$num = $num + $d[$count2];
				$count2++;
				$j--;
				}
			else{
				$ret = $num;
				last;}}

	
		$num = 0;

			while(1){
				if($i){
						$num = $num + 365;
						$i--;	}
				else{last;}}
				
			while(1){
				if($z > 4 ){
					$count++;
					$z= $z-4;	}
				else{
					if($z==4){
						$count++;
						last;}
					else{last;}}}
			$num=$num+$count;
			$ret=$ret+$num+$d;
			
			return $ret;}
1;