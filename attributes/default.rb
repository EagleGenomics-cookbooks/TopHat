#################################################
default['Bowtie']['version'] = '1.1.1'
#################################################
default['TopHat']['version'] = '2.0.13'
default['TopHat']['filename'] = 'tophat-' + default['TopHat']['version'] + '.tar.gz'
default['TopHat']['url'] = 'https://ccb.jhu.edu/software/tophat/downloads/' + default['TopHat']['filename']
default['TopHat']['install_dir'] = '/usr/local/'
default['TopHat']['dir'] = default['TopHat']['install_dir'] + '/tophat-' + default['TopHat']['version']
#################################################
#################################################
