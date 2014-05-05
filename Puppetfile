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

github "boxen", "3.4.2"

# Support for default hiera data in modules

github "module-data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",     "1.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.0.100"
github "git",         "2.2.2"
github "go",          "1.1.0"
github "homebrew",    "1.6.1"
github "hub",         "1.3.0"
github "inifile",     "1.0.3", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.3"
github "nodejs",      "3.7.0"
github "openssl",     "1.0.0"
github "phantomjs",   "2.1.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "7.2.4"
github "stdlib",      "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.1.1"
github "php", "1.1.5"
github "wget", "1.0.1"
github "autoconf", "1.0.0"
github "pcre", "1.0.0"
github "libpng", "1.0.0"
github "mysql", "1.2.0"
github "libtool"
github "chrome"
github "phpstorm"
github "vagrant"
github "alfred"
github "virtualbox"
github "firefox"
github "iterm2"
github "textmate"
github "spotify"
github "cyberduck"
github "dropbox"
github "fish"
github "osx"
#github "sshfs", "1.0.4", :repo => "jverdeyen/puppet-sshfs"
github "flux", "0.0.1", :repo => "technicalpickles/puppet-flux"

mod "brewcask", :git => "git://github.com/phinze/puppet-brewcask.git"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
