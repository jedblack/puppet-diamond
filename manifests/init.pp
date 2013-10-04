# == Class: diamond
#
# A module to manage Diamond, a Python daemon that collects system metrics and publishes them to Graphite (and others).
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
# [*hostname*]
#   Hardcode an hostname for the collector path rather then determining one automatically.
#   Keep in mind, periods are seperators in Graphite.
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
  $collectors_path = $diamond::params::collectors_path,
  $config          = $diamond::params::config,
  $config_template = $diamond::params::config_template,
  $enable          = $diamond::params::enable,
  $graphite_host   = $diamond::params::graphite_host,
  $hostname        = $diamond::params::hostname,
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

  validate_absolute_path($collector_config_basedir)
  validate_string($collector_config_template)
  validate_absolute_path($collectors_path)
  validate_absolute_path($config)
  validate_string($config_template)
  validate_bool($enable)
  validate_string($graphite_host)
  validate_string($hostname)
  validate_string($librato_user)
  validate_string($librato_apikey)
  validate_string($package_name)
  validate_string($riemann_host)
  validate_absolute_path($run_directory)
  validate_string($service_name)
  validate_bool($start)
  validate_string($version)

  class{'diamond::install': } ->
  class{'diamond::config': } ~>
  class{'diamond::service': } ->
  Class['diamond']
}
