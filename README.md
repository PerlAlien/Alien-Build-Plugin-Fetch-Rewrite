# Alien::Build::Plugin::Fetch::Rewrite ![linux](https://github.com/plicease/Alien-Build-Plugin-Fetch-Rewrite/workflows/linux/badge.svg) ![macos](https://github.com/plicease/Alien-Build-Plugin-Fetch-Rewrite/workflows/macos/badge.svg) ![windows](https://github.com/plicease/Alien-Build-Plugin-Fetch-Rewrite/workflows/windows/badge.svg) ![cygwin](https://github.com/plicease/Alien-Build-Plugin-Fetch-Rewrite/workflows/cygwin/badge.svg) ![msys2-mingw](https://github.com/plicease/Alien-Build-Plugin-Fetch-Rewrite/workflows/msys2-mingw/badge.svg)

Alien::Build plugin to rewrite network requests to local resources

# SYNOPSIS

In your ~/.alienbuild/rc.pl:

```perl
postload 'Fetch::Rewrite';

sub rewrite {
  my($build, $uri) = @_;

  # $build isa Alien::Build
  # $uri isa URI

  if($uri->host eq 'ftp.gnu.org')
  {
    # if we see a request to ftp.gnu.org (either ftp or http)
    # we redirect it to the local mirror at
    # http://mirror.example.com/ftp.gnu.org
    $uri->scheme('http');
    $uri->host('mirror.example.com');
    $uri->host('/ftp.gnu.org' . $uri->path);
  }
}

1;
```

# DESCRIPTION

This plugin allows you to rewrite the URLs for remote networked resources
to local resources.  This is useful if you are building CPAN modules that
rely on [Alien](https://metacpan.org/pod/Alien) distributions where you do not have system packages.  It
may also seem useful if you do not trust the remote resources, although
please keep in mind that like a `Makefile.PL` or `Build.PL`, an [alienfile](https://metacpan.org/pod/alienfile)
is arbitrary Perl code, and should be appropriately vetted before being
used in an environment with security requirements.

# CAVEATS

This plugin is only able to rewrite URLs that are fetched through the standard
[Alien::Build](https://metacpan.org/pod/Alien::Build) URL fetching interface, and only URLs that are supported by
[LWP::UserAgent](https://metacpan.org/pod/LWP::UserAgent) and [URI](https://metacpan.org/pod/URI).

# SEE ALSO

- [Alien::Build](https://metacpan.org/pod/Alien::Build)

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2017-2022 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
