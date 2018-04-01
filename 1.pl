#!/usr/bin/perl
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

				if($link =~ /nclicks\(rig\.rankpol\)/){
					$link .=" junci  ";
					$link =~ s/nclicks\(rig\.rankpol\)//g;
				}
				elsif($link =~ /nclicks\(rig\.rankeco\)/){
					$link .=" gungjae ";
					$link =~ s/nclicks\(rig\.rankeco\)//g;
				}
				elsif($link =~ /nclicks\(rig\.ranksoc\)/){
					$link .=" sahoi ";
					$link =~ s/nclicks\(rig\.ranksoc\)//g;
				}
				elsif($link =~ /nclicks\(rig\.ranklif\)/){
					$link .=" moonhwa ";
					$link =~ s/nclicks\(rig\.ranklif\)//g;
			}
				elsif($link =~ /nclicks\(rig\.rankwor\)/){
					$link .=" jonghap ";
					$link =~ s/nclicks\(rig\.rankwor\)//g;
				}
				elsif($link =~ /nclicks\(rig\.ranksci\)/){
					$link .=" it/sic ";
					$link =~ s/nclicks\(rig\.ranksci\)//g;
				}
				elsif ($link =~ /nclicks\(rig\.rankent\)/) {
					$link .=" TV ";
					$link =~ s/nclicks\(rig\.rankent\)//g; 
				}
				elsif ($link =~ /nclicks\(rig\.rankspo\)/) {
					$link .=" spor ";
					$link =~ s/nclicks\(rig\.rankspo\)//g;
				}

				$link =~ s/ class="*"|"/ /g; 				
				}
		}
		if($link){
			print $link.encode('utf8',$headname),"\n";
		}
	}
}
