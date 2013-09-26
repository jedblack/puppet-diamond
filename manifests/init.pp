# == Class: diamond
#
# A basic module to manage diamond, stats collection daemon for Graphite
#
# === Parameters
# [*collector_config_basedir*]
#   The base directory under which collector configs will be deployed.
#
# [*collector_config_template*]
#   The path to the template of the collector configs.
#
# [*config*]
#   The path to where the main diamond configuration file will be deployed.
#
# [*config_template*]
#   The path to the template of the main diamond configuration file.
#
# [*enable*]
#   Should the service be enabled during boot time?
#
# [*graphite_host*]
#   Where to find the graphite server
#
# [*interval*]
#   How often should metrics be collected and sent to Graphite
#
# [*librato_user*]
#   Your Librato username
#
# [*librato_apikey*]
#   Your Librato apikey
#
# [*package_name*]
#   The name of the diamond package to install.
#
# [*riemann_host*]
#   Where to find the riemann server
#
# [*run_directory*]
#   The path to the directory where diamond stores run-time information.
#
# [*service_name*]
#   The name of the diamond service.
#
# [*start*]
#   Should the service be started by Puppet
#
# [*version*]
#   The package version to install
#
class diamond(
  $collector_config_basedir  = $diamond::params::collector_config_basedir,
  $collector_config_template = $diamond::params::collector_config_template,
  $config          = $diamond::params::config,
  $config_template = $diamond::params::config_template,
  $enable          = $diamond::params::enable,
  $graphite_host   = $diamond::params::graphite_host,
  $interval        = $diamond::params::interval,
  $librato_user    = $diamond::params::librato_user,
  $librato_apikey  = $diamond::params::librato_apikey,
  $package_name    = $diamond::params::package_name,
  $riemann_host    = $diamond::params::riemann_host,
  $run_directory   = $diamond::params::run_directory,
  $service_name    = $diamond::params::service_name,
  $start           = $diamond::params::start,
  $version         = $diamond::params::version,
) inherits diamond::params {

  class{'diamond::install': } ->
  class{'diamond::config': } ~>
  class{'diamond::service': } ->
  Class['diamond']
}
