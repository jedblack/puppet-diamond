class diamond::install {
  package { $diamond::package_name:
    ensure  => $diamond::version,
  }
  file { $diamond::run_directory:
    ensure => directory,
  }
}
