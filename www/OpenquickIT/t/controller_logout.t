use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'OpenquickIT' }
BEGIN { use_ok 'OpenquickIT::Controller::logout' }

ok( request('/logout')->is_success, 'Request should succeed' );


