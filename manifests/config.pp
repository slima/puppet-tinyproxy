class tinyproxy::config inherits tinyproxy {
  File {
    owner   => 'root',
    group   => 'root',
    require => Class['tinyproxy::install'],
    notify  => Class['tinyproxy::service']
  }

  file { $tinyproxy::tinyproxy_config:
    ensure  => file,
    content => template("${module_name}/tinyproxy.conf.erb")
  }
}