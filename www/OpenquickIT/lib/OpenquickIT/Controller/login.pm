package OpenquickIT::Controller::login;

use strict;
use warnings;
use parent 'Catalyst::Controller';

=head1 NAME

OpenquickIT::Controller::login - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head2 index

Login logic (authentication)

=cut

sub index :Path :Args(0) {
    my ($self, $c) = @_;
    
    # Get the username and password from form
    my $username = $c->request->params->{username} || "";
    my $password = $c->request->params->{password} || "";
    
    # If the username and password values were found in form
    if ($username && $password) {
        if ($c->authenticate({ username => $username,
                               password => $password  } )) {
            # If successful, then let them use the application
            $c->response->redirect($c->uri_for('/'));
            return;
        } else {
            # Set an error message
            $c->stash->{error_msg} = "Bad username or password.";
            $c->stash->{template}  = 'login.tt';
        }
    }
    # If either of above don't work out, send to the login page
    $c->stash->{template} = 'login.tt';
}

=head1 AUTHOR

Iñigo Tejedor Arrondo,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
