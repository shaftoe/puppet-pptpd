#
# Manage pptpd package installation
#
class pptpd::package () {

  case $::osfamily {
    'Debian','RedHat': {
      package { 'pptpd': ensure => $pptpd::ensure }
    }
    default: { fail "Operating system ${::operatingsystem} not supported" }
  }
}
