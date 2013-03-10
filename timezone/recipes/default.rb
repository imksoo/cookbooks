#
# Cookbook Name:: timezone
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

script "timezone" do
	interpreter "bash"
	user "root"
	code <<-EOH
		diff /usr/share/zoneinfo/#{node.timezone.name} /etc/localtime 2>&1 /dev/null
		if [ $? -ne 0 ] ; then
			rm -f /etc/localtime
			cp -p /usr/share/zoneinfo/#{node.timezone.name} /etc/localtime
		fi
	EOH
end
