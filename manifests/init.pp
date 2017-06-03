# Class: tinyproxy
# ===========================
#
# Full description of class tinyproxy here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'tinyproxy':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class tinyproxy (
  Boolean $manage_service,
  String $service_name,
  Boolean $manage_package,
  String $package_name,
  String $tinyproxy_config,
  Array $allow_hosts,
  Optional[String] $connect_port,
  Optional[String] $default_error_file,
  Optional[String] $filter_default_deny,
  Optional[String] $filter_file,
  Optional[String] $filter_extended,
  Optional[String] $user,
  Optional[String] $group,
  Optional[String] $log_file,
  Optional[String] $log_level,
  Optional[String] $max_clients,
  Optional[String] $max_requests_perchild,
  Optional[String] $max_spare_servers,
  Optional[String] $min_spare_servers,
  Optional[String] $pid_file,
  Optional[String] $port,
  Optional[String] $start_servers,
  Optional[String] $stat_file,
  Optional[String] $timeout,
  Optional[String] $via_proxy_name,
){
  contain tinyproxy::install
  contain tinyproxy::config
  contain tinyproxy::service

  Class['::tinyproxy::install']
  -> Class['::tinyproxy::config']
  ~> Class['::tinyproxy::service']
}