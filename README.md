# Alien::Build::Plugin::Fetch::Rewrite [![Build Status](https://secure.travis-ci.org/plicease/Alien-Build-Plugin-Fetch-Rewrite.png)](http://travis-ci.org/plicease/Alien-Build-Plugin-Fetch-Rewrite)

Alien::Build plugin to rewrite network requests to local resources

# SYNOPSIS

    export ALIEN_BUILD_POSTLOAD=Fetch::Rewrite

# DESCRIPTION

This plugin allows you to rewrite the URLs for remote networked resources
to local resources.  This is useful if you are building CPAN modules that
rely on [Alien](https://metacpan.org/pod/Alien) distributions where you do not have system packages.  It
may also seem useful if you do not trust the remote resources, although
please keep in mind that like a `Makefile.PL` or `Build.PL`, an [alienfile](https://metacpan.org/pod/alienfile)
is arbitrary Perl code, and should be appropriately vetted before being
used in an environment with security requirements.

# SEE ALSO

- [Alien::Build](https://metacpan.org/pod/Alien::Build)

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2017 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
