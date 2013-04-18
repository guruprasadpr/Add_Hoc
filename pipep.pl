#!/usr/bin/perl 
use strict;
use warnings;
use Data::Dumper;
use IO::Pipe;
use POSIX qw(:errno_h :fcntl_h);
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
        $pipe->reader;
        $pipe->autoflush(1);
        #my @arr=`cat file`;
        #chomp @arr;
        #$pipe->print("@arr");
        #$pipe->eof;
        POSIX::dup2($pipe,0);
        exec "/usr/bin/sort -n ";
        waitpid($pid,0);
}else{
        print "I am child : $$ ";
        $pipe->writer;
        #my $line=$pipe->getline();
        #print "Line read is $line ";
        POSIX::dup2($pipe,1);
        #sleep 1;
        exec "/usr/bin/cat file ";
}

print "outside $$";
