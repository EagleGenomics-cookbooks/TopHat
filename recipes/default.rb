#
# Cookbook Name:: TopHat
# Recipe:: default
#
# Copyright (c) 2016 Eagle Genomics Ltd, Apache License, Version 2.0.
##########################################################
# package install

package ['zlib-devel', 'tar', 'epel-release'] do
  action :install
end

# This needs to be installed after epel-release repo is added
package ['clang'] do
  action :install
end

##########################################################

include_recipe 'build-essential'
include_recipe 'boost'
include_recipe 'Bowtie'

##########################################################
# here for use by serverspec

magic_shell_environment 'TOPHAT_VERSION' do
  value node['TopHat']['version']
end

##########################################################
# main recipe

remote_file "#{Chef::Config[:file_cache_path]}/#{node['TopHat']['filename']}" do
  source node['TopHat']['url']
  action :create_if_missing
end

execute 'un-tar TopHat tar ball' do
  command "tar zxvf #{Chef::Config[:file_cache_path]}/#{node['TopHat']['filename']} -C #{node['TopHat']['install_dir']}"
  not_if { ::File.exist?("#{node['TopHat']['dir']}/README") }
end

execute 'Configure with location of boost files' do
  command './configure --with-boost=/usr/local'
  cwd node['TopHat']['dir']
  not_if { ::File.exist?("#{node['TopHat']['dir']}/Makefile") }
end

execute 'TopHat make' do
  command 'make'
  cwd node['TopHat']['dir']
  not_if { ::File.exist?("#{node['TopHat']['dir']}/src/tophat") }
end

execute 'TopHat make install' do
  command 'make install'
  cwd node['TopHat']['dir']
  not_if { ::File.exist?("#{node['TopHat']['install_dir']}/bin/tophat") }
end

##########################################################
##########################################################
