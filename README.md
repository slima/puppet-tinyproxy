# tinyproxy
[![Build Status](https://travis-ci.org/shazi7804/puppet-tinyproxy.svg?branch=master)](https://travis-ci.org/shazi7804/puppet-tinyproxy)


#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with tinyproxy](#setup)
    * [What tinyproxy affects](#what-tinyproxy-affects)
    * [Setup requirements](#setup-requirements)
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
  allow_hosts       => ['192.168.0.0/24','172.16.0.0/24'],
  max_clients       => '128',
  max_spare_servers => '128'
}
```

### Configuring white list

```puppet
class { '::tinyproxy':
  filter_default_deny => 'Yes',
  filter_file         => '/etc/tinyproxy/tinyproxy_filter.conf',
  filter_extended     => 'On'.
  manage_filter       => true,
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
