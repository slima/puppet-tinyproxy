class tinyproxy::service inherits tinyproxy {

  if tinyproxy::manage_service == true {
    service { $tinyproxy::service_name:
      ensure    => running,
      subscribe => Package['tinyproxy'],
      require   => Class['tinyproxy::install'],
    }
  }
}
