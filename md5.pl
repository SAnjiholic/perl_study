#!/usr/bin/perl --

use strict;
use Digest::MD5  qw(md5_hex);
my $md5_data = "1";
my $md5_hash = md5_hex( $md5_data );
print "$md5_hash\n";

