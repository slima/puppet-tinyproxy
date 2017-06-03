class tinyproxy::install inherits tinyproxy {
  if $tinyproxy::package_name {
    package { 'tinyproxy':
      ensure => installed,
      notify => Class['tinyproxy::service'],
    }
  }
}