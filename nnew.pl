use LWP::Simple;
use Encode;

$url = "http://news.naver.com/#";
my $res = get($url);
@res = split(/<*>/,$res);
foreach(@res){
	if(/ title=/){
		my $headname = $';
		my $link;
		if($`=~/ href="/){
			if($' =~/^#"/){$link=undef;}
			else{ 
				$link=$';
				$link =~ s/ class="*"|"/ /g; 				
				}
		}
		if($link){
		print $link.encode('cp949',$headname),"\n";
		}
	}
}
