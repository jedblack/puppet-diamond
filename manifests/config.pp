class diamond::config inherits diamond {
  file { $config:
    ensure  => present,
    content => template($config_template),
  }
}
