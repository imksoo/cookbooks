#
# Cookbook Name:: disable-selinux
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

script "disable-selinux" do
	interpreter "bash"
	flags "-e"
	user "root"
	code <<-EOH
		setenforce 0
		grep '^[^#]*SELINUX=disable' /etc/sysconfig/selinux
		if [ $? -ne 0 ] ; then
			sed -i.bak "s/^SELINUX=.*$/SELINUX=disabled/g" /etc/sysconfig/selinux
		fi
	EOH
end
