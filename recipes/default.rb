#
# Cookbook Name:: TopHat
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
##########################################################

include_recipe 'build-essential'
include_recipe 'boost-source'
include_recipe 'Bowtie'

##########################################################
# here for use by serverspec

magic_shell_environment 'TOPHAT_VERSION' do
  value node['TopHat']['version']
end

##########################################################
# package install

package ['zlib-devel'] do
  action :install
end

##########################################################
# main recipe

remote_file "#{Chef::Config[:file_cache_path]}/#{node['TopHat']['filename']}" do
  source node['TopHat']['url']
  action :create_if_missing
end

execute "tar zxvf #{Chef::Config[:file_cache_path]}/#{node['TopHat']['filename']} -C #{node['TopHat']['install_dir']}" do
  not_if { ::File.exist?("#{node['TopHat']['dir']}/README") }
end

execute "./configure --with-boost=/usr/local" do
  cwd node['TopHat']['dir']
  not_if { ::File.exist?("#{node['TopHat']['dir']}/Makefile") }
end

execute "make" do
  cwd node['TopHat']['dir']
  not_if { ::File.exist?("#{node['TopHat']['dir']}/src/tophat") }
end

execute "make install" do
  cwd node['TopHat']['dir']
  not_if { ::File.exist?("#{node['TopHat']['install_dir']}/bin/tophat") }
end

##########################################################
##########################################################
