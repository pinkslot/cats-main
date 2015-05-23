package CATS::Problem::Generated;

use strict;
use warnings;

use CATS::Constants;
use CATS::DB;

sub new
{
    my ($class, $self) = @_;
    $self ||= {};
    $self->{id} ||= new_id;
    bless $self, $class;
    $self;
}

sub insert 
{
    my $self = shift;
    $dbh->do(q~
        INSERT INTO gen_problems (id, account_id, contest_id, problem_id, state)
        VALUES(?, ?, ?, ?, ?)~, undef,
        map($self->{$_}, qw(id account_id contest_id problem_id)), $cats::gst_not_processed);
    $dbh->commit;
}

1;