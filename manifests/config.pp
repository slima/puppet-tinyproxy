class tinyproxy::config inherits tinyproxy {
  File {
    owner   => 'root',
    group   => 'root',
    require => Class['tinyproxy::install'],
    notify  => Class['tinyproxy::service'],
  }

  file { $tinyproxy::tinyproxy_dir:
    ensure  => directory,
  }

  file { $tinyproxy::tinyproxy_config:
    ensure  => file,
    content => template("${module_name}/tinyproxy.conf.erb"),
  }

  if $manage_filter_list {
    file { $tinyproxy::filter_list:
      ensure  => file,
      content => template("${module_name}/filter.list.erb"),
    }
  }
}