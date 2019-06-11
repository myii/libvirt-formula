# coding: utf-8
#
# sockets_ro_spec.rb -- Libvirt read only socket InSpec control
# Author: Daniel Dehennin <daniel.dehennin@ac-dijon.fr>
# Copyright © 2019 Pôle de Compétences Logiciels Libres <eole@ac-dijon.fr>
#
params = libvirt.config

control 'Libvirt read only socket' do
  title 'should exist with proper permissions'

  describe libvirt_socket_ro do
    it { should exist }
    its('type') { should eq :socket }
    its('owner') { should eq 'root' }
    its('group') { should eq params['unix_sock_group'] }
    its('mode') { should cmp params['unix_sock_ro_perms'] }
  end

end
