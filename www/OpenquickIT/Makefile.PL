#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install;

name 'OpenquickIT';
all_from 'lib/OpenquickIT.pm';

requires 'Catalyst::Runtime' => '5.80013';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'parent';

# This should reflect the config file format you've chosen
# See Catalyst::Plugin::ConfigLoader for supported formats
requires 'Config::General';

# Add here your custom requires
requires 'Catalyst::View::TT';
requires 'Catalyst::View::JSON';
requires 'Catalyst::Plugin::Authentication';
requires 'Catalyst::Plugin::Session';
requires 'Catalyst::Plugin::Session::State::Cookie';
requires 'Catalyst::Plugin::Session::Store::FastMmap';
requires 'Catalyst::Plugin::Unicode';

# End of custom requires
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
