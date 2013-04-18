
package Stud1;

sub new {
        my $class=shift;
        print "class is $class ";
        my $class=ref($class) || $class;
        my $href={Name=>shift,Age=>shift,Marks=>shift};
        bless $href,$class;
        return $href;
}

sub disp {
        my $this=shift;
        print "In stdu1 disp ";
        foreach (keys%$this){
                print $_,' => ', $this->{$_};
        }
}
1;


