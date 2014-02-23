package App::Provision::Git;
$App::Provision::Git::VERSION = '0.01';
BEGIN {
  $App::Provision::Git::AUTHORITY = 'cpan:GENE';
}
use strict;
use warnings;
use parent qw( App::Provision::Tiny );

sub git
{
    my $self = shift;
    $self->recipe(
      [qw( brew install git )],
    );
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

App::Provision::Git

=head1 VERSION

version 0.01

=head1 AUTHOR

Gene Boggs <gene@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Gene Boggs.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
