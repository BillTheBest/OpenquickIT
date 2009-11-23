package OpenquickIT::Controller::reports;

use strict;
use warnings;
use parent 'Catalyst::Controller';

=head1 NAME

OpenquickIT::Controller::reports - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched OpenquickIT::Controller::reports in reports.');
}


=head1 AUTHOR

Iñigo Tejedor Arrondo,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
