# plagiarised from https://github.com/TheGiftsProject/our-boxen

class outlandish::nginxcert {
  include nginx

  # create SSL certificate
  file { "${nginx::config::configdir}/ssl":
    ensure => "directory"
  }

  file { "${nginx::config::configdir}/ssl/nginx-cert-init.sh":
    ensure => present,
    mode => '0755',
    source => 'puppet:///modules/outlandish/nginx-cert-init.sh',
  }

  exec { "bash ${nginx::config::configdir}/ssl/nginx-cert-init.sh": 
    require => File["${nginx::config::configdir}/ssl/nginx-cert-init.sh"],
    cwd => "${nginx::config::configdir}/ssl",
    creates => ["${nginx::config::configdir}/ssl/server.crt", 
                "${nginx::config::configdir}/ssl/server.key"],
  }

}