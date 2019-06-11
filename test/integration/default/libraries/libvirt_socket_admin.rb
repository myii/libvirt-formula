# coding: utf-8
#
# libvirt_socket_admin.rb -- Libvirt admin socket InSpec resources
# Author: Daniel Dehennin <daniel.dehennin@ac-dijon.fr>
# Copyright © 2019 Pôle de Compétences Logiciels Libres <eole@ac-dijon.fr>
#
class LibvirtSocketAdminResource < Inspec.resource(1)
  name 'libvirt_socket_admin'

  supports platform_name: 'debian'
  supports platform_name: 'ubuntu'
  supports platform_name: 'centos'
  supports platform_name: 'fedora'
  supports platform_name: 'opensuse'
  supports platform_name: 'suse'

  def initialize
    if (inspec.os[:name] == 'debian' and inspec.os[:release] < '9') or
       (inspec.os[:name] == 'ubuntu' and inspec.os[:release] <= '16.04')
      return skip_resource "#{inspec.os[:name].capitalize} version #{inspec.os[:release]} is not supported"
    end

    @file = inspec.file('/var/run/libvirt/libvirt-admin-sock')
  end

  def exist?
    @file.exist?
  end

  def method_missing(name)
    @file.send(name)
  end

end
