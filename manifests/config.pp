class diamond::config {
  file { $diamond::config:
    ensure  => present,
    content => template($diamond::config_template),
  }

  $collectors = hiera('diamond::collectors', {})
  create_resources('diamond::collector', $collectors)

}
