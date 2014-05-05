
class people::tamlyn {

	include osx::global::enable_keyboard_control_access
	include osx::global::expand_save_dialog
	include osx::finder::show_hidden_files
	include osx::global::key_repeat_rate
	class { 'osx::dock::icon_size':
	  size => 28
	}
	class { 'osx::dock::position':
	  position => 'left'
	}
	boxen::osx_defaults { 'dock_magnification':
		domain => 'com.apple.dock',
	    key    => 'largesize',
	    type   => 'float',
	    value  => 64,
	    user   => $::boxen_user,
	    notify => Exec['killall Dock'];
	}
	

	class { 'fish':
	  chsh => false,
	}

	package {
		['spotify', 'flux', 'jitouch','adobe-creative-cloud']:
			provider => 'brewcask'
		}
	
}