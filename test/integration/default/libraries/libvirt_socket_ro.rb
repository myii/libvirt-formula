# coding: utf-8
#
# libvirt_socket_ro.rb -- Libvirt read only socket InSpec resources
# Author: Daniel Dehennin <daniel.dehennin@ac-dijon.fr>
# Copyright © 2019 Pôle de Compétences Logiciels Libres <eole@ac-dijon.fr>
#
class LibvirtSocketRoResource < Inspec.resource(1)
  name 'libvirt_socket_ro'

  supports platform_name: 'debian'
  supports platform_name: 'centos'

  def initialize
    @file = inspec.file('/var/run/libvirt/libvirt-sock-ro')
  end

  def exist?
    @file.exist?
  end

  def method_missing(name)
    @file.send(name)
  end

end
