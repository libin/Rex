#
# (c) Jan Gehring <jan.gehring@gmail.com>
# 
# vim: set ts=3 sw=3 tw=0:
# vim: set expandtab:

package Rex::Inventory::Hal::Object::Net;

use strict;
use warnings;

use Rex::Inventory::Hal::Object;
use base qw(Rex::Inventory::Hal::Object);

sub new {
   my $that = shift;
   my $proto = ref($that) || $that;
   my $self = { @_ };

   bless($self, $proto);

   return $self;
}

sub get_dev {
   my ($self) = @_;
   return $self->get('net.interface');
}

sub get_mac {
   my ($self) = @_;
   return $self->get('net.address');
}

sub get_product {
   my ($self) = @_;
   return ($self->parent()->get('info.product') || $self->parent()->get('pci.product')) || "";
}

sub get_vendor {
   my ($self) = @_;
   return $self->parent()->get('info.vendor') || "";
}

1;
