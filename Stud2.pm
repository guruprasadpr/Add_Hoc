
package Stud2;

use Stud1;
@ISA=qw(Stud1);

sub disp {
        my $this=shift;
        print "In stdu2 disp ";
        foreach (keys%$this){
                print $_,' => ', $this->{$_};
        }
}

1;
