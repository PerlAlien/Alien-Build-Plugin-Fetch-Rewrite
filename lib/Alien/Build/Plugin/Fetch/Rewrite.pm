package Alien::Build::Plugin::Fetch::Rewrite;

use strict;
use warnings;
use 5.008001;
use URI;
use Alien::Build;
use Alien::Build::Plugin;
use Alien::Build::Plugin::Fetch::LWP;

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

=head1 CAVEATS

This plugin is only able to rewrite URLs that are fetched through the standard
L<Alien::Build> URL fetching interface, and only URLs that are supported by
L<LWP::UserAgent> and L<URI>.

=cut

sub init
{
  my($self, $meta) = @_;
  # this just lets people know that we have loaded
  # this plugin.
  Alien::Build->log("init");

  unless($meta->prop->{start_url})
  {
    Alien::Build->log("sorry! this plugin requires a default url to function");
    Alien::Build->log("no rewrites will be possible");
    return;
  }

  Alien::Build::Plugin::Fetch::LWP->new->init($meta);

  $meta->around_hook(fetch => sub {
    my($f, $build, $url) = @_;

    $url ||= $build->meta_prop->{start_url};

    if(Alien::Build::rc->can('rewrite'))
    {
      my $orig = URI->new($url);
      my $copy = $orig->clone;
      Alien::Build::rc::rewrite($build, $copy);
      if("$copy" ne "$orig")
      {
        $build->log("rewriting $orig as $copy");
        $url = "$copy";
      }
    }
    
    return $f->($build, $url);
  });
}

1;

=head1 SEE ALSO

=over 4

=item L<Alien::Build>

=back
