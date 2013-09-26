class diamond::install inherits diamond {
  package { $package_name:
    ensure  => $version,
  }
  file { $run_directory:
    ensure => directory,
  }
}
