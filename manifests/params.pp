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
}
