define diamond::collector (
  $options = undef,
) {

  file {"${diamond::collector_config_basedir}/${name}.conf":
    content => template($diamond::collector_config_template),
  }
}
