use Test2::V0;
use Test::Alien::Build;
use Alien::Build::Plugin::Fetch::Rewrite;

$ENV{ALIEN_BUILD_POSTLOAD} = 'Fetch::Rewrite';

my $build = alienfile_ok q{
  use alienfile;
  
  share {
  
    fetch sub { die 'oh noes!' }
  
  };
};

done_testing
