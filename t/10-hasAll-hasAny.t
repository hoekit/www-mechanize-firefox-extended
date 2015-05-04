use strict;
use warnings FATAL => 'all';

use Time::HiRes qw/tv_interval gettimeofday/;
use Test::More tests => 5;

use lib 'lib';
BEGIN { use_ok('WWW::Mechanize::Firefox::Extended') };

my $DEBUG = 0;
my ($got, $exp, $msg, $tmp);
my ($t0, $elapsed, $wait, $found);
my $o = WWW::Mechanize::Firefox::Extended->new();

#----- Test hasAll()
$o->get_local('10-hasAll-hasAny.html');

$msg = 'hasAll() - Positive test';
$got = $o->hasAll('#form1', '//input[@name="username"]', '.ui');
$exp = '1';
is($got, $exp, $msg);

$msg = 'hasAll() - Negative test';
$got = $o->hasAll('#form1', '//input[@name="username"]', '.uix');
$exp = '0';
is($got, $exp, $msg);

#----- Test hasAny()
$o->get_local('10-hasAll-hasAny.html');

$msg = 'hasAny() - Positive test';
$got = $o->hasAny('#form1', '//input[@name="username"]', 'xxx');
$exp = '1';
is($got, $exp, $msg);

$msg = 'hasAny() - Negative test';
$got = $o->hasAll('#form1xxx', '//input[@name="username"]xxx', '.uix');
$exp = '0';
is($got, $exp, $msg);

