#
# Config files
#
class pptpd::config () inherits pptpd {

  require 'pptpd::package'

  file { '/etc/pptpd.conf':
    ensure  => $pptpd::ensure,
    owner   => 'root',
    mode    => '0440',
    content => template('pptpd/pptpd.conf.erb')
  }

}
