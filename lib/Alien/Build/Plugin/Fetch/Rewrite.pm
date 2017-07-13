package Alien::Build::Plugin::Fetch::Rewrite;

use strict;
use warnings;
use 5.008001;
use Alien::Build::Plugin;
use Alien::Build;

# ABSTRACT: Alien::Build plugin to rewrite network requests to local resources
# VERSION

=head1 SYNOPSIS

 export ALIEN_BUILD_POSTLOAD=Fetch::Rewrite

=head1 DESCRIPTION

This plugin allows you to rewrite the URLs for remote networked resources
to local resources.  This is useful if you are building CPAN modules that
rely on L<Alien> distributions where you do not have system packages.  It
may also seem useful if you do not trust the remote resources, although
please keep in mind that like a C<Makefile.PL> or C<Build.PL>, an L<alienfile>
is arbitrary Perl code, and should be appropriately vetted before being
used in an environment with security requirements.

=cut

sub init
{
  my($self, $meta) = @_;
  
  Alien::Build->log("using Fetch::Rewrite plugin!");
}

1;

=head1 SEE ALSO

=over 4

=item L<Alien::Build>

=back
