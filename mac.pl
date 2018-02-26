#!/usr/bin/perl

sub mac
{
my @mac = `getmac`; @mac = split(/ / ,$mac[3]);
return $mac[0];
}
