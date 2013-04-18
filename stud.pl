#!/usr/bin/perl 
use strict;
use warnings;
use Data::Dumper;
use UNIVERSAL 'isa';
$\="\n";

use Stud2;

my $s1= Stud2->new('Guru',28,75);
$s1->disp();
my $s2= $s1->new('Ram',29,79);
$s2->disp();

