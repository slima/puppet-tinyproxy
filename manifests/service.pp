class tinyproxy::service inherits tinyproxy {
  if $tinyproxy::manage_service {
    case $facts['osfamily'] {
      'Debian': {
        service { $tinyproxy::service_name:
          ensure    => running,
          subscribe => Package['tinyproxy'],
          require   => Class['tinyproxy::install'],
        }
      }
      'RedHat': {
        service { $tinyproxy::service_name:
          ensure    => running,
          subscribe => Package['tinyproxy'],
          require   => Class['tinyproxy::install'],
        }
      }
      default: {
        service { $tinyproxy::service_name:
          ensure     => running,
          hasstatus  => true,
          hasrestart => true,
          restart    => "/sbin/restart ${tinyproxy::service_name}",
          start      => "/sbin/start ${tinyproxy::service_name}",
          status     => "/sbin/status ${tinyproxy::service_name}",
          stop       => "/sbin/stop ${tinyproxy::service_name}",
          subscribe  => Package['tinyproxy'],
          require    => Class['tinyproxy::install'],
        }
      }
    }
  }
}