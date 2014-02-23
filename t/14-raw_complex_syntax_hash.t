#!perl
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;
use lib './t';
use dbixtest;

plan tests => 4;

use_ok( 'DBIx::Raw' ) || print "Bail out!\n";

my $people = people();
my $db = prepare();
my $person  = $db->raw(query=>"SELECT name,age FROM dbix_raw WHERE id=1");

is(ref $person, 'HASH', 'Raw Hash Complex Syntax is Hash');

is($person->{name}, $people->[0]->[0], 'Raw Hash Complex Syntax name');
is($person->{age}, $people->[0]->[1], 'Raw Hash Complex Syntax age');
