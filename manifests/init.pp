# == Class: diamond
#
# A basic module to manage diamond, stats collection daemon for Graphite
#
# === Parameters
# [*version*]
#   The package version to install
#
# [*enable*]
#   Should the service be enabled during boot time?
#
# [*start*]
#   Should the service be started by Puppet
#
# [*interval*]
#   How often should metrics be collected and sent to Graphite
#
# [*graphite_host*]
#   Where to find the graphite server
#
# [*librato_user*]
#   Your Librato username
#
# [*librato_apikey*]
#   Your Librato apikey
#
# [*riemann_host*]
#   Where to find the riemann server
#
class diamond(
  $enable         = $diamond::params::enable,
  $graphite_host  = $diamond::params::graphite_host,
  $interval       = $diamond::params::interval,
  $librato_user   = $diamond::params::librato_user,
  $librato_apikey = $diamond::params::librato_apikey,
  $riemann_host   = $diamond::params::riemann_host,
  $start          = $diamond::params::start,
  $version        = $diamond::params::version,
) inherits diamond::params {

  class{'diamond::install': } ->
  class{'diamond::config': } ~>
  class{'diamond::service': } ->
  Class['diamond']
}
