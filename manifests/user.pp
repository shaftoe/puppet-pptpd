#
# Add or remove users
#
define pptpd::user ($password = 'secret', $ensure = 'present') {

  require 'pptpd::config'

  $s = "${name} pptpd ${password} *"

  if $ensure == 'absent' {
    exec { "remove ${name}":
      command => "/bin/sed -i '/$s/d' /etc/ppp/chap-secrets",
      onlyif  => "/bin/grep '${s}' /etc/ppp/chap-secrets",
    }
  } else {
    exec { "add ${name}":
      command => "/bin/echo '${s}' >> /etc/ppp/chap-secrets",
      unless  => "/bin/grep '${s}' /etc/ppp/chap-secrets",
    }
  }

}
