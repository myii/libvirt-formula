# coding: utf-8
#
# libvirt.rb -- Libvirt InSpec resources
# Author: Daniel Dehennin <daniel.dehennin@ac-dijon.fr>
# Copyright © 2019 Pôle de Compétences Logiciels Libres <eole@ac-dijon.fr>
#
class LibvirtResource < Inspec.resource(1)
  name 'libvirt'

  supports platform_name: 'debian'
  supports platform_name: 'ubuntu'
  supports platform_name: 'centos'
  supports platform_name: 'fedora'
  supports platform_name: 'opensuse'
  supports platform_name: 'suse'

  def service_name
    if inspec.os[:name] == 'ubuntu' and inspec.os[:release] < '18.04'
    then
      'libvirt-bin'
    elsif inspec.os[:name] == 'debian' and inspec.os[:release] < '8'
      'libvirt-bin'
    else
      'libvirtd'
    end
  end

  def config_file
    return inspec.file('/etc/libvirt/libvirtd.conf')
  end

  def daemon_config_dir
    return case inspec.os[:family]
           when 'arch'
             '/etc/conf.d'
           when 'debian'
             '/etc/default/'
           when 'fedora', 'redhat', 'suse'
             '/etc/sysconfig'
           else
             raise Inspec::Exceptions::ResourceSkipped,
                   "OS family #{inspec.os[:family]} not supported"
           end
  end

  def daemon_config_file
    return inspec.file(File.join(daemon_config_dir, service_name))
  end

end
