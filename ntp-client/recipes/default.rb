#
# Cookbook Name:: ntp-client
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "ntp" do
	action :install
end

service "ntpd" do
	action [:start , :enable]
end

