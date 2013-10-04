class diamond::install {
  package { $diamond::package_name:
    ensure  => $diamond::version,
  }
  file { $diamond::run_directory:
    ensure => directory,
  }
  file { "${diamond::collectors_path}/systemstat":
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Package[$diamond::package_name],
  }
  file { "${diamond::collectors_path}/systemstat/systemstat.py":
    ensure  => file,
    source  => "puppet:///modules/${module_name}/systemstat.py",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File["${diamond::collectors_path}/systemstat/systemstat.py"],
  }
}
