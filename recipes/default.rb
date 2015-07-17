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

execute 'un-tar TopHat tar ball' do
  command "tar zxvf #{Chef::Config[:file_cache_path]}/#{node['TopHat']['filename']} -C #{node['TopHat']['install_dir']}"
  not_if { ::File.exist?("#{node['TopHat']['dir']}/README") }
end

execute 'Configure with location of boost files'  do
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
