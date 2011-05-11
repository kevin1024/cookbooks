#
# Cookbook Name:: redis
# Recipe:: default
#

package "redis" do
  action :install
end

service "redis" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

template "/etc/redis.conf" do
  source "redis.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "redis")
end
