A Puppet module for managing the installation and configuration of [Diamond](https://github.com/BrightcoveOS/Diamond).

[![Build Status](https://secure.travis-ci.org/miguno/puppet-diamond.png)](https://travis-ci.org/miguno/puppet-diamond)


# Usage

For experimenting you are probably fine just with:

    include diamond

This installs diamond but does not ship the metrics anywhere, it just runs the archive handler.


## Configuration

This module currently exposes a few configurable options, for example
the Graphite host and polling interval. So you can also do:

    class { 'diamond':
      graphite_host => 'graphite.example.com',
      interval      => 10,
    }


### Configuring handlers

Diamond supports a number of different handlers, for the moment this module supports only the Graphite, Librato and
Riemann handers.  Pull request happily accepted to add others.

With Librato:

    class { 'diamond':
      librato_user   => 'bob',
      librato_apikey => 'jim',
    }

With Riemann:

    class { 'diamond':
      riemann_host => 'riemann.example.com',
    }

Note that you can include more than one of these at once.

    class { 'diamond':
      librato_user   => 'bob',
      librato_apikey => 'jim',
      riemann_host   => 'riemann.example.com',
      graphite_host  => 'graphite.example.com',
    }


### Configuring collectors

With Hiera:

```yaml
diamond::collectors:
  CPUCollector: {}
    options:
      path: cpu
  DiskSpaceCollector: {}
```

This example enables the CPUCollector and DiskSpaceCollector, and customizes the former to use `path = cpu`.


# Requirements

## Mandatory requirements

* Access to a package repository from which `diamond` can be installed (e.g. `yum install diamond` must work).


## Optional requirements

The Riemann and Librato handlers require some additional Python libraries not currently installed by this module.

    package {[
      'simplejson',
      'requests',
      'bernhard',
    ]:
      ensure   => installed,
      provider => pip,
    }


# Setting up a local development environment

After cloning this git repository you only need to run:

    $ ./bootstrap


## Running tests

    $ rake spec


## Running lint

    $ rake lint
