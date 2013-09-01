#
# Manage pptpd daemon
#
class pptpd::service () {

  require 'pptpd::config'

  $ensure = $pptpd::ensure ? {
    'present' => 'running',
    default   => 'stopped'
  }

  service { 'pptpd': ensure => $ensure }

}
