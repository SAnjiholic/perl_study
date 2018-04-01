#!/usr/bin/perl
use LWP::Simple;
use Encode;


$url = "http://www.dailysecu.com";
#$url = "http://news.naver.com/#";
my $res = getprint($url);

#print encode('utf8',$res);

