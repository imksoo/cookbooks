#
# Cookbook Name:: mysql-server
# Recipe:: default
#
# Copyright 2013, Kirino Minato / @imksoo
#
# All rights reserved - Do Not Redistribute
#

yum_package "mysql-server"

service "mysqld" do
	action [:enable, :start]
end

script "mysql_secure_installation" do
	interpreter "bash"
	code <<-"EOH"
		if [ -d `cat /etc/my.cnf | grep "datadir" | sed 's/datadir *= *//g'`/test ]; then
		mysql -uroot <<-EOT
		-- SET ROOT PASSWORD --
		UPDATE mysql.user SET Password=PASSWORD\('P@ssw0rd'\) WHERE User='root';
		-- REMOVE ANONYMOUS USERS --
		DELETE FROM mysql.user WHERE User='';
		-- REMOVE REMOTE ROOT --
		DELETE FROM mysql.user WHERE User='root' AND Host NOT IN \('localhost', '127.0.0.1', '::1'\);
		-- REMOVE TEST DATABASE --
		DROP DATABASE test;
		DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
		-- RELOAD PRIVILEGE TABLES --
		FLUSH PRIVILEGES;
EOT
		fi
	EOH
end

