# TopHat

https://ccb.jhu.edu/software/tophat/index.shtml

Description
===========
This Cookbook to installs TopHat.

TopHat is a fast splice junction mapper for RNA-Seq reads. It aligns RNA-Seq reads to 
mammalian-sized genomes using the ultra high-throughput short read aligner 
Bowtie, and then analyzes the mapping results to identify splice junctions 
between exons.

https://ccb.jhu.edu/software/tophat/index.shtml 

Requirements
============

## Platform:

* Centos 6.5
* RHEL 6.5

Notes
=====
This TopHat installs its own version of samtools, bit it addes the version to the program name (i.e. samtools_VERSION) so there
should not be a conflict. 

Usage
=====
Simply include the recipe wherever you would like it installed, such as a run list (recipe[TopHat]) or a cookbook (include_recipe 'TopHat')

## Testing
To test the recipe we use chef test kitchen:

kitchen converge default-centos65 

kitchen login default-centos65

kitchen verify default-centos65

kitchen destroy default-centos65

Attributes
==========
See attributes/default.rb for default values.

default['TopHat']['version']
default['Bowtie']['version'] = '1.1.1'

default['boost-source']['major_ver'] = '1'
default['boost-source']['minor_ver'] = '58'
default['boost-source']['patch_ver'] = '0'

License and Authors
===================

* Authors:: Bart Ailey (<chef@eaglegenomics.com>)
* Authors:: Dan Barrell (<chef@eaglegenomics.com>)
* Authors:: Nick James (<chef@eaglegenomics.com>)
    

Copyright:: 2015, Eagle Genomics Ltd
    
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
    
ToDo
====


