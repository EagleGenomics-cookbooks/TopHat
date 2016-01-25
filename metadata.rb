name 'TopHat'
maintainer 'Eagle Genomics'
maintainer_email 'chef@eaglegenomics.com'
license 'apache2'
description 'Installs/Configures TopHat'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.1'

depends 'build-essential'
depends 'boost-source'
depends 'magic_shell'
depends 'Bowtie'
