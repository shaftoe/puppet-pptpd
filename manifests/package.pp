#
# Install package
#
class pptpd::package () {

  case $::osfamily {
    'Debian': {
      package { 'pptpd': ensure => present }
    }
    default: { fail "Operating system family ${::osfamily} not supported" }
  }
}
