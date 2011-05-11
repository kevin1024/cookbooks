#
# Cookbook Name:: beanstalkd
# Recipe:: default
#

package "beanstalkd" do
  action :install
end

service "beanstalkd" do
  supports :restart => true
  action [ :enable, :start ]
end
