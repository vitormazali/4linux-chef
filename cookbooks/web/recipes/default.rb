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
