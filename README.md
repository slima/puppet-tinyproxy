# tinyproxy

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
  filter_extended     => '128'
}
```


## Reference

Here, include a complete list of your module's classes, types, providers,
facts, along with the parameters for each. Users refer to this section (thus
the name "Reference") to find specific details; most users don't read it per
se.

## Limitations

This is where you list OS compatibility, version compatibility, etc. If there
are Known Issues, you might want to include them under their own heading here.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel
are necessary or important to include here. Please use the `## ` header.
