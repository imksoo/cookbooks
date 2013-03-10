#
# Cookbook Name:: zabbix-agent
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

rpm_zabbix_filename = "zabbix-2.0.5-1.el6.x86_64.rpm"
rpm_zabbix_checksum = "3fd5a6a1eaeeb65d4dad8270fecb888be517aaaf122edd3aaf3dc877e044aacd"

cookbook_file "/tmp/#{rpm_zabbix_filename}" do
	source "#{rpm_zabbix_filename}"
	checksum "#{rpm_zabbix_checksum}"
end

package "zabbix" do
	action :install
	source "/tmp/#{rpm_zabbix_filename}"
	provider Chef::Provider::Package::Rpm
end

rpm_zabbix_agent_filename = "zabbix-agent-2.0.5-1.el6.x86_64.rpm"
rpm_zabbix_agent_checksum = "b43dedd0b362371e6c9939b6194405fc490c6389b58ce65c39148367fa2bc8e5"

cookbook_file "/tmp/#{rpm_zabbix_agent_filename}" do
	source "#{rpm_zabbix_agent_filename}"
	checksum "#{rpm_zabbix_agent_checksum}"
end

package "zabbix-agent" do
	action :install
	source "/tmp/#{rpm_zabbix_agent_filename}"
	provider Chef::Provider::Package::Rpm
end
