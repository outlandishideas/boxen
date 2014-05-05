class projects::jericho {
	outlandish::project{'jericho':
		source => 'git@nowpensions.git.beanstalkapp.com:/nowpensions/jericho.git',
		web_path => '/web',
		ssl => true
	}
}