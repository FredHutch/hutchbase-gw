name 'hutchbase-gw'
maintainer 'Scientific Computing'
maintainer_email 'scicomp@fredhutch.org'
license 'apache'
description 'Installs/Configures hutchbase-gw'
long_description 'Installs/Configures hutchbase-gw'
version '0.1.4'
source_url 'https://github.com/FredHutch/hutchbase-gw'
issues_url 'https://github.com/FredHutch/hutchbase-gw/issues'

depends 'nginx', '~> 2.7.9'
depends 'chef-vault'
depends 'tomcat', '~> 2.3.2'
depends 'java_se', '~> 8.0'
depends 'sudo', '~> 3.1.0'
