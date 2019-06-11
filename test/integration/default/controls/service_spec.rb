# coding: utf-8
#
# service_spec.rb -- Libvirt service InSpec control
# Author: Daniel Dehennin <daniel.dehennin@ac-dijon.fr>
# Copyright © 2019 Pôle de Compétences Logiciels Libres <eole@ac-dijon.fr>
#
control 'Libvirt service' do
  title 'verify running service'

  describe service(libvirt.service_name) do
    it { should be_enabled }
    it { should be_running }
  end
end
