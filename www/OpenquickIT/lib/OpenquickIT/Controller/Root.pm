package OpenquickIT::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';

=head1 NAME

OpenquickIT::Controller::Root - Root Controller for OpenquickIT

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

=head2 auto
    
Check if there is a user and, if not, forward to login page
    
=cut

# Note that 'auto' runs after 'begin' but before your actions and that
# 'auto's "chain" (all from application path to most specific class are run)
# See the 'Actions' section of 'Catalyst::Manual::Intro' for more info.
sub auto : Private {
    my ($self, $c) = @_;

    # Allow unauthenticated users to reach the login page.  This
    # allows unauthenticated users to reach any action in the Login
    # controller.  To lock it down to a single action, we could use:
    #   if ($c->action eq $c->controller('login')->action_for('index'))
    # to only allow unauthenticated access to the 'index' action we
    # added above.
    if ($c->controller eq $c->controller('login')) {
        return 1;
    }
    # If a user doesn't exist, force login
    if (!$c->user_exists) {
        # Dump a log message to the development server debug output
        $c->log->debug('***Root::auto User not found, forwarding to /login');
        # Redirect the user to the login page
        $c->response->redirect($c->uri_for('/login'));
        # Return 0 to cancel 'post-auto' processing and
        # prevent use of application.
        return 0;
    }

    # User found, so return 1 to continue with processing after this 'auto'
    return 1;
}

=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash->{template} = 'dashboard.tt';
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Iñigo Tejedor Arrondo,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
