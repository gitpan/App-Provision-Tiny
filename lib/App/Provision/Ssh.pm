package App::Provision::Ssh;
$App::Provision::Ssh::VERSION = '0.02';
BEGIN {
  $App::Provision::Ssh::AUTHORITY = 'cpan:GENE';
}
use strict;
use warnings;
use parent qw( App::Provision::Tiny );

sub condition
{
    my $self = shift;

    die "Program '$self->{program}' must include --keytype and --keyname\n"
        unless $self->{keytype} && $self->{keyname};

    # Set the keyfile attribute.
    $self->{keyfile} = sprintf '%s/.ssh/id_%s-%s', $ENV{HOME},
        $self->{keytype}, $self->{keyname};

    my $condition = -e $self->{keyfile};
    warn $self->{program}, ' is', ($condition ? '' : "n't"), " installed\n";

    return $condition ? 1 : 0;
}

sub ssh
{
    my $self = shift;
    $self->recipe(
      [ 'ssh-keygen', '-t', $self->{keytype}, '-f', $self->{keyfile} ],
      [ "cat $self->{keyfile}.pub | tr -d '\n' | pbcopy" ],
      [ 'echo', '* Now paste your public key into https://github.com/settings/ssh *' ],
    );
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

App::Provision::Ssh

=head1 VERSION

version 0.02

=head1 AUTHOR

Gene Boggs <gene@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Gene Boggs.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
