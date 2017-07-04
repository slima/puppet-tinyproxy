class tinyproxy::service inherits tinyproxy {
  service { $tinyproxy::service_name:
    ensure    => running,
    subscribe => Package['tinyproxy'],
    require   => Class['tinyproxy::install'],
  }
}