# coding: utf-8
#
# config_spec.rb -- Libvirt configuration InSpec control
# Author: Daniel Dehennin <daniel.dehennin@ac-dijon.fr>
# Copyright © 2019 Pôle de Compétences Logiciels Libres <eole@ac-dijon.fr>
#
params = libvirt.config

control 'Libvirt configuration' do
  title 'verify applied configuration options'

  parse_options = {
    # Value can be surrounded by quotes, or not
    assignment_regex: /^\s*([^=]*?)\s*=\s*['"]?(.*?)['"]?\s*$/,
  }

  describe libvirt.daemon_config_file do
    it { should exist }
  end

  describe libvirt.config_file do
    it { should exist }
  end

  describe parse_config_file(libvirt.config_file.path, parse_options) do
    params.each do | param, value |
      its(param) { should eq value }
    end
  end

end
