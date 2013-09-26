class diamond::service {
  $ensure = $diamond::start ? { true => 'running', default => 'stopped' }
  service { $diamond::service_name:
    ensure     => $ensure,
    enable     => $diamond::enable,
    hasstatus  => true,
    hasrestart => true,
  }
}

