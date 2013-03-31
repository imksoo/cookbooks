#
# Cookbook Name:: zabbix-server
# Recipe:: default
#
# Copyright 2013, Kirino Minato / @imksoo
#
# All rights reserved - Do Not Redistribute
#

yum_package "zabbix20-server-mysql"
yum_package "zabbix20-web-mysql"

service "iptables" do
	action [:disable, :stop]
end

service "ip6tables" do
	action [:disable, :stop]
end


script "php-datetime" do
	interpreter "bash"
	flags "-e"
	code <<-EOH
		awk '{print}' >> /etc/php.ini
		echo "date.timezone=Asia/Tokyo" >> /etc/php.ini
	EOH
	only_if do
		File.readlines("/etc/php.ini").grep(/^[^;]*date.timezone/).length == 0
	end
end
