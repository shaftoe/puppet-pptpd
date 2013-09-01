#
# Add / remove users from /etc/ppp/chap-secrets
#
define pptpd::user ($password = 'secret', $ensure = 'present') {

  require 'pptpd::config'

  $s = "${name} pptpd ${password} *"

  if $ensure == 'absent' {
    exec { "pptpd remove ${name} user":
      command => "/bin/sed -i '/${name} pptpd/d' /etc/ppp/chap-secrets",
      onlyif  => "/bin/grep '${s}' /etc/ppp/chap-secrets",
    }
  } else {
    exec { "pptpd add ${name} user":
      command => "/bin/echo '${s}' >> /etc/ppp/chap-secrets",
      unless  => "/bin/grep '${s}' /etc/ppp/chap-secrets",
    }
  }

}
