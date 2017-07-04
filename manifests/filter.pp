class tinyproxy::filter (
  Array $filters,
){
  File {
    owner   => 'root',
    group   => 'root',
    require => Class['tinyproxy::install'],
    notify  => Class['tinyproxy::service'],
  }

  file { $tinyproxy::tinyproxy_dir:
    ensure  => directory,
  }

  file { $tinyproxy::filter_file:
    ensure  => file,
    content => template("${module_name}/filter.list.erb"),
  }
}