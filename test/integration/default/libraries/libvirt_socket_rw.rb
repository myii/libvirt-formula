# coding: utf-8
#
# libvirt_socket_rw.rb -- Libvirt read/write socket InSpec resources
# Author: Daniel Dehennin <daniel.dehennin@ac-dijon.fr>
# Copyright © 2019 Pôle de Compétences Logiciels Libres <eole@ac-dijon.fr>
#
class LibvirtSocketRwResource < Inspec.resource(1)
  name 'libvirt_socket_rw'

  supports platform_name: 'debian'
  supports platform_name: 'ubuntu'
  supports platform_name: 'centos'
  supports platform_name: 'fedora'
  supports platform_name: 'opensuse'
  supports platform_name: 'suse'

  def initialize
    @file = inspec.file('/var/run/libvirt/libvirt-sock')
  end

  def exist?
    @file.exist?
  end

  def method_missing(name)
    @file.send(name)
  end

end
