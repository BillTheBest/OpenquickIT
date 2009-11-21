use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'OpenquickIT' }
BEGIN { use_ok 'OpenquickIT::Controller::login' }

ok( request('/login')->is_success, 'Request should succeed' );


