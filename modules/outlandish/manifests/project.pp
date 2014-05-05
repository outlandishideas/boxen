define outlandish::project(
	$ssl = false,
	$web_path = "/",
	$source = "ssh://tsr@beta.gd:7777/var/projects/$name/$name.git",
	$php = '5.4.17',
) {
	require outlandish::nginxcert
	
	php::project { $name:
		source => $source,
		mysql => $name,
		nginx => 'outlandish/nginx.conf.erb',
		php => $php
	}
}