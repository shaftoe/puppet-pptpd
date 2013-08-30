#
# Manage pptpd daemon
#
class pptpd::service () {

  require 'pptpd::config'

  service { 'pptpd': ensure => running }

}
