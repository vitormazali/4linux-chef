#
# Cookbook:: web
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package ['apache2'] do
  action :install
  only_if { node['platform_family'] == 'debian' }
end

package ['httpd'] do
  action :install
  only_if { node['platform_family'] == 'rhel' }
end

template '/var/www/html/index.html' do
  source 'template1.erb'
end

service 'apache2' do
  only_if { node['platform_family'] == 'debian' }
  action [:enable, :start]
end

service 'httpd' do
  only_if { node['platform_family'] == 'rhel' }
  action [:enable, :start]
end

