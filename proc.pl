#!/usr/bin/perl 
use strict;
use warnings;
use Data::Dumper;
use IO::Pipe;
$\="\n";

sub chldprg {
        print "captured the child ";
}

$SIG{CHLD}=\&chldprg;

print "-" x 50;

my $pipe=IO::Pipe->new;
print "pipe is $pipe ";
my $pid=fork;
if ($pid) {
        print "Inside parent process : $$";
        $pipe->writer;
        $pipe->autoflush(1);
        $pipe->print("ad the");
        #$pipe->eof;
        waitpid($pid,0);
}else{
        print "I am child : $$ ";
        $pipe->reader;
        my $line=$pipe->getline();
        print "Line read is $line ";
        #sleep(1);
}

print "outside $$";
