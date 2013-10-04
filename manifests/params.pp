class diamond::params {
  $collector_config_basedir  = '/etc/diamond/collectors'
  $collector_config_template = 'diamond/etc/diamond/collectors/collector.conf.erb'
  $config          = '/etc/diamond/diamond.conf'
  $config_template = 'diamond/etc/diamond/diamond.conf.erb'
  $enable          = true
  $graphite_host   = undef
  $hostname        = undef
  $interval        = 30
  $librato_user    = undef
  $librato_apikey  = undef
  $package_name    = 'diamond'
  $riemann_host    = undef
  $run_directory   = '/var/run/diamond'
  $service_name    = 'diamond'
  $start           = true
  $version         = 'present'

  case $::operatingsystem {
    'CentOS', 'Fedora', 'RedHat', 'Amazon', 'Scientific', 'Debian', 'Ubuntu': {
      # This is indeed the default location for the OS'es listed above.
      $collectors_path = '/usr/share/diamond/collectors'
    }
    default: {
      # We must set a default value because Travis CI apparently reports '' as $::operatingsystem.
      # This location is guessed, even though we use the same value as for CentOS etc.
      $collectors_path = '/usr/share/diamond/collectors'
      warning("'${module_name}' does not really support operating system '${::operatingsystem}'")
      warning("Setting '\$collectors_path' to ${collectors_path} but this may be wrong!")
    }
  }

}
