package App::Provision::Homebrew;
$App::Provision::Homebrew::VERSION = '0.02';
BEGIN {
  $App::Provision::Homebrew::AUTHORITY = 'cpan:GENE';
}
use strict;
use warnings;
use parent qw( App::Provision::Tiny );

sub condition
{
    my $self = shift;

    # Reset the program name.
    $self->{program} = 'brew';

    my $condition = -e $self->{program};
    warn $self->{program}, ' is', ($condition ? '' : "n't"), " installed\n";

    return $condition ? 1 : 0;
}

sub homebrew
{
    my $self = shift;
    $self->recipe(
      [ 'ruby', '-e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"' ],
      [ 'brew', 'doctor' ],
    );
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

App::Provision::Homebrew

=head1 VERSION

version 0.02

=head1 AUTHOR

Gene Boggs <gene@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Gene Boggs.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
