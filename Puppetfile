# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen"

# Support for default hiera data in modules

github "module-data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq"
github "foreman"
github "gcc"
github "git"
github "homebrew"
github "inifile",     "1.0.3", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx"
github "nodejs"
github "openssl"
github "phantomjs"
github "pkgconfig"
github "repository"
github "ruby"
github "stdlib",      "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo"
github "xquartz"
github "php"
github "wget"
github "autoconf"
github "pcre"
github "libpng"
github "mysql"
github "libtool"
github "vagrant"
github "virtualbox"
github "iterm2"
github "textmate"
github "fish"
github "osx"

mod "brewcask", :git => "git://github.com/phinze/puppet-brewcask.git"
mod "phpmyadmin", :git => "git://github.com/tamlyn/puppet-phpmyadmin.git"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
