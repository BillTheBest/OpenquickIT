package OpenquickIT::View::TT;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    INCLUDE_PATH       => [ OpenquickIT->path_to( 'root', ), ],
);

=head1 NAME

OpenquickIT::View::TT - TT View for OpenquickIT

=head1 DESCRIPTION

TT View for OpenquickIT.

=head1 SEE ALSO

L<OpenquickIT>

=head1 AUTHOR

Iñigo Tejedor Arrondo,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
