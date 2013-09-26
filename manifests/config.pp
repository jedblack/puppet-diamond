class diamond::config {
  file { $diamond::config:
    ensure  => present,
    content => template($diamond::config_template),
  }
}
