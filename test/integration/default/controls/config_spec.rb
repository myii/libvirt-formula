# coding: utf-8
#
# config_spec.rb -- Libvirt configuration InSpec control
# Author: Daniel Dehennin <daniel.dehennin@ac-dijon.fr>
# Copyright © 2019 Pôle de Compétences Logiciels Libres <eole@ac-dijon.fr>
#
control 'Libvirt configuration' do
  title 'verify applied configuration options'

  describe libvirt.daemon_config_file do
    it { should exist }
  end

  describe libvirt.config_file do
    it { should exist }
  end

end
