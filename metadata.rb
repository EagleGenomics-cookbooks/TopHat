name 'TopHat'
maintainer 'Eagle Genomics'
maintainer_email 'chef@eaglegenomics.com'
license 'Apache v2.0'
description 'Installs/Configures TopHat'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.2'

source_url 'https://github.com/EagleGenomics-cookbooks/TopHat'
issues_url 'https://github.com/EagleGenomics-cookbooks/TopHat/issues'

depends 'build-essential'
depends 'boost-source'
depends 'magic_shell'
depends 'Bowtie'
