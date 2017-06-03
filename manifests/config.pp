class tinyproxy::config inherits tinyproxy {
  file { $tinyproxy::tinyproxy_config:
    ensure  => file,
    content => template(${module_name}/tinyproxy.conf.erb),
  }
}