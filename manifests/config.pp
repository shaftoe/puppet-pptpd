#
# Config files
#
class pptpd::config () {

  require 'pptpd::package'

  file { '/etc/pptpd.conf':
    ensure  => present,
    owner   => 'root',
    mode    => '0440',
    content => 'option /etc/ppp/pptpd-options
logwtmp

localip 192.168.0.1
remoteip 192.168.0.234-238,192.168.0.245
',
  }

}
