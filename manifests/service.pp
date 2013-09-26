class diamond::service inherits diamond {
  $ensure = $start ? { true => running, default => stopped }
  service { $service_name:
    ensure     => $ensure,
    enable     => $enable,
    hasstatus  => true,
    hasrestart => true,
  }
}

