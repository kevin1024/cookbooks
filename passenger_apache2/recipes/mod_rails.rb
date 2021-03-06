#
# Cookbook Name:: passenger_apache2
# Recipe:: default
#
# Author:: Joshua Timberman (<joshua@opscode.com>)
# Author:: Joshua Sierles (<joshua@37signals.com>)
# Author:: Michael Hale (<mikehale@gmail.com>)
#
# Copyright:: 2009, Opscode, Inc
# Copyright:: 2009, 37signals
# Coprighty:: 2009, Michael Hale
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe "passenger_apache2"

if platform?("centos","redhat") and dist_only?
  package "mod_passenger" do
    notifies :run, resources(:execute => "generate-module-list"), :immediately
  end

  file "#{node[:apache][:dir]}/conf.d/mod_passenger.conf" do
    action :delete
    backup false 
  end
else  
  template "#{node[:apache][:dir]}/mods-available/passenger.load" do
    cookbook "passenger_apache2"
    source "passenger.load.erb"
    owner "root"
    group "root"
    mode 0755
  end
end

template "#{node[:apache][:dir]}/mods-available/passenger.conf" do
  cookbook "passenger_apache2"
  source "passenger.conf.erb"
  owner "root"
  group "root"
  mode 0755
end

apache_module "passenger"
