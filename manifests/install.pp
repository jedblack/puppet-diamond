class diamond::install inherits diamond {
  package { 'diamond':
    ensure  => $version,
  }
  file { '/var/run/diamond':
    ensure => directory,
  }
}
