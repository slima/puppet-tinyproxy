class tinyproxy::install inherits tinyproxy {
  if $facts['osfamily'] == 'RedHat' {
    package { 'epel-release': ensure => installed }
  }

  if $facts['osfamily'] == 'Debian' or $facts['osfamily'] == 'RedHat' {
    if $tinyproxy::manage_package {
      package { $tinyproxy::package_name:
        ensure => installed,
        notify => Class['tinyproxy::service'],
      }
    }
  }
  else {
    fail ("Unsupported osfamily ${facts['osfamily']}")
  }
}
