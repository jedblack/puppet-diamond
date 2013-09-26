class diamond::service inherits diamond {
  $ensure = $start ? {true => running, default => stopped}
  service { 'diamond':
    ensure     => $ensure,
    enable     => $enable,
    hasstatus  => true,
    hasrestart => true,
  }
}

