#!/usr/bin/perl -w
use strict;
use lib qw(lib);
use Test;

BEGIN {
 plan tests => 6;
}

# Test 1
print_test('Require module');
eval {require Telephony::CountryDialingCodes;};
ok($@ ? 0 : 1);


# Test 2
print_test('Create object');
my $o = new Telephony::CountryDialingCodes();
ok(defined($o) ? 1 : 0);


# Test 3
my $country_code = 'NL';
my $dialing_code = 31;
print_test("Check if dialing code for $country_code is $dialing_code");
ok($o->dialing_code($country_code), $dialing_code);


# Test 4
print_test("Check if dialing code $dialing_code is for country $country_code");
my @country_codes = $o->country_codes($dialing_code);
ok(@country_codes && ($country_codes[0] eq $country_code) ? 1 : 0);


# Test 5
my $phn = '+521234567890';
print_test("Extracting dialing code from $phn");
$dialing_code = $o->extract_dialing_code($phn);
ok($dialing_code, '52');


# Test 6
print_test("Testing all country codes");
eval {require Geography::Countries;};
skip($@,
 sub {
  my @countries = Geography::Countries::code2();
  my @missing;
  foreach my $code (sort (@countries)) {
   unless(defined($o->dialing_code($code))) {
    push(@missing,"$code - " . Geography::Countries::country($code));
   }
  }
  if (@missing) {
   print "\nWARNING: no dialing codes found for the following countries:\n";
   print join("\n",@missing) . "\n";
  }
  print_test('');
  return 1;
 }
);



sub print_test {
 my $s = shift;
 $s .= '.' x (45 - length($s));
 print $s;
}