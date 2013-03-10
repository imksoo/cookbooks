#
# Cookbook Name:: epel
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

rpm_epel_filename = "epel-release-6-8.noarch.rpm"
rpm_epel_checksum = "e5ed9ecf22d0c4279e92075a64c757ad2b38049bcf5c16c4f2b75d5f6860dc0d"

cookbook_file "/tmp/#{rpm_epel_filename}" do
	source "#{rpm_epel_filename}"
	checksum "#{rpm_epel_checksum}"
end

package "epel" do
	action :install
	source "/tmp/#{rpm_epel_filename}"
	provider Chef::Provider::Package::Rpm
end

