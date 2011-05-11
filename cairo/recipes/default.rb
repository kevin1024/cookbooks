#
# Cookbook Name:: cairo
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
#
#pixman_version = '0.18.4-1.1'
#cairo_version = '1.8.8-3.1'

#%w{pixman-0.18.4-1.1 pixman-devel-0.18.4-1.1 cairo-1.8.8-3.1 cairo-devel-1.8.8-3.1}.each do |p|
#
#  cookbook_file "/tmp/#{p}.#{node[:kernel][:machine]}.rpm" do
#    source "#{p}.#{node[:kernel][:machine]}.rpm"
#    mode "0644"
#  end
#
#  package p do
#    action :install
#    source "/tmp/#{p}.#{node[:kernel][:machine]}.rpm"
#    options "--nogpgcheck"
#  end
#
#end
#

yum_repository "realgeeks" do
  description "RealGeeks Yum repo - $basearch"
  url "http://yum.realgeeks.com/rhel/5/$basearch"
  enabled "1"
  action :add
end

package "pixman" do
  action :install
  version "0.18.4-1.1"
end

package "cairo" do
  action :install
  version "1.8.8-3.1"
end


