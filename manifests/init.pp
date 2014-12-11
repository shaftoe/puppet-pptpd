# == Class: pptpd
#
# Install and configure pptpd
#
# === Parameters
#
# [ensure]
# defaults to 'present', if so it installs and configure pptpd, otherwise
# it will remove config files and package
#
# === Examples
#
# include 'pptpd'
# pptpd::user { 'myuser': password => 'mysecret' }
#
# === Authors
#
# Alexander Fortin <alexander.fortin@gmail.com>
#
class pptpd (
  $ensure      = 'present',
  $option      = '/etc/ppp/pptpd-options',
  $stimeout    = 10,
  $debug       = false,
  $bcrelay     = false,
  $connections = 100,
  $delegate    = true,
  $localip     = $::ipaddress,
  $remoteip    = '192.168.0.234-238,192.168.0.245',
  $dns_servers = [],
  $nmb_servers = [],
  $noipparam   = false,
  $listen      = false,
  $pidfile     = '/var/run/pptpd.pid',
  $speed       = 115200,
  $logwtmp     = true
  ) {

  include 'pptpd::package'
  include 'pptpd::config'
  include 'pptpd::service'

  Class['pptpd::config'] ~> Class['pptpd::service']

}
