require boxen::environment
require homebrew
require gcc

# resource defaults

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}


Homebrew::Formula <| |> -> Package <| |>

# node definitions

node default {
	# core modules, needed for most things
	include dnsmasq
	include git
	include nginx

	# fail if FDE is not enabled
	if $::root_encrypted == 'no' {
		fail('Please enable full disk encryption and try again')
	}
	
	#include php::composer
	php::extension::xdebug { 'xdebug for 5.4.17':
	    php     => '5.4.17'
	}

	include phpmyadmin

	include projects::watson
	outlandish::project{'unitlist':}
	include projects::jericho
	
	include brewcask
	
	package {
		['clipmenu', 'iterm2', 'textmate', 'google-chrome', 'phpstorm', 'cyberduck', 
		'dropbox', 'firefox', 'launchcontrol']:
			provider => 'brewcask',
			require => Class['brewcask']
		}

  # common, useful packages
  package {
    ['ack', 'findutils', 'gnu-tar']:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}
