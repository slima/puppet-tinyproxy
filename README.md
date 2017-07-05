# tinyproxy
[![Build Status](https://travis-ci.org/shazi7804/puppet-tinyproxy.svg?branch=master)](https://travis-ci.org/shazi7804/puppet-tinyproxy) [![Puppet Forge](https://img.shields.io/puppetforge/dt/shazi7804/tinyproxy.svg?style=flat-square)](https://forge.puppet.com/shazi7804/tinyproxy) [![Puppet Forge](https://img.shields.io/puppetforge/v/shazi7804/tinyproxy.svg?style=flat-square)](https://forge.puppet.com/shazi7804/tinyproxy)


#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with tinyproxy](#setup)
    * [Beginning with tinyproxy](#beginning-with-tinyproxy)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

The aws agent module installs, configures, and manages the tinyproxy service across a range of operating systems and distributions.

## Setup

### Beginning with tinyproxy

`include '::tinyproxy'` is enough to get you up and running.

## Usage

All parameters for the ntp module are contained within the main `::tinyproxy` class, so for any function of the module, set the options you want. See the common usages below for examples.

### Install and enable tinyproxy

```puppet
include '::tinyproxy'
```

### Configuring general

```puppet
class { '::tinyproxy':
  port              => 3128,
  allow_hosts       => ['192.168.0.0/24','172.16.0.0/24'],
  max_clients       => 128,
  max_spare_servers => 256,
  min_spare_servers => 64,

}
```

### Configuring white list

```puppet
class { '::tinyproxy':
  filter_default_deny => true,
  filter_file         => '/etc/tinyproxy/filter.conf',
  filter_extended     => true
}
```

```puppet
class { '::tinyproxy::filter':
  filters => ['^apt\.puppetlabs\.com$',
              '^github\.com$',]
}
```

## Reference

### Classes

#### Public classes

* tinyproxy: Main class, includes all other classes.

#### Private classes

* tinyproxy::install: Handles the packages.
* tinyproxy::config: Handles the config.
* tinyproxy::filter: Handles the filter list.
* tinyproxy::service: Handles the service.

## Limitations

This module has been tested platform on:

* Red Hat Enterprise Linux (RHEL) 6, 7
* CentOS 6, 7
* Debian 6, 7
* Ubuntu 16.04

## Development

Puppet modules on the Puppet Forge are open projects, and community contributions are essential for keeping them great. Please follow our guidelines when contributing changes.

For more information, see our [module contribution guide.](https://docs.puppetlabs.com/forge/contributing.html)

### Contributors

To see who's already involved, see the [list of contributors.](https://github.com/puppetlabs/puppetlabs-ntp/graphs/contributors)
