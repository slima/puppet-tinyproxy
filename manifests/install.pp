class tinyproxy::install inherits tinyproxy {
  if $tinyproxy::manage_package {
    package { $tinyproxy::package_name:
      ensure => installed,
      notify => Class['tinyproxy::service'],
    }
  }
}