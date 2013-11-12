# puppet-diamond [![Build Status](https://travis-ci.org/miguno/puppet-diamond.png?branch=master)](https://travis-ci.org/miguno/puppet-diamond)

A Wirbelsturm-compatible Puppet module for managing the installation and configuration of
[Diamond](https://github.com/BrightcoveOS/Diamond).

---

Table of Contents

* <a href="#usage">Usage and configuration</a>
    * <a href="#handlers">Configuring handlers</a>
    * <a href="#collectors">Configuring collectors</a>
* <a href="#requirements">Requirements</a>
    * <a href="#mandatory-reqs">Mandatory requirements</a>
    * <a href="#optional-reqs">Optional requirements</a>
* <a href="#development-enviroment">Setting up a local development environment</a>
    * <a href="#tests">Running tests</a>
    * <a href="#lint">Running lint</a>

---

<a name="usage"></a>

# Usage and configuration

For experimenting you are probably fine just with:

    include diamond

This installs diamond but does not ship the metrics anywhere, it just runs the archive handler.

This module currently exposes a few configurable options, for example the Graphite host and polling interval.  So you can
also do:

    class { 'diamond':
      graphite_host => 'graphite.example.com',
      interval      => 10,
    }


<a name="handlers"></a>

## Configuring handlers

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

Using Hiera and YAML instead of Puppet manifests:

```yaml
---
classes:
  - diamond

# Configure Diamond to send metrics to the Graphite host 'graphite.example.com'
diamond::graphite_host: 'graphite.example.com'
```


<a name="collectors"></a>

## Configuring collectors

Using Hiera and YAML:

```yaml
---
classes:
  - diamond

diamond::collectors:
  CPUCollector: {}
    options:
      path: cpu
  DiskSpaceCollector: {}
```

This example enables the CPUCollector and DiskSpaceCollector, and customizes the former to use `path = cpu`.


<a name="requirements"></a>

# Requirements

_Tested on RHEL/CentOS 6._


<a name="mandatory-reqs"></a>

## Mandatory requirements

* Access to a package repository from which `diamond` can be installed (e.g. `yum install diamond` must work).
* Puppet 3.0+
* Ruby 1.9 (preferred) or 1.8


<a name="optional-reqs"></a>

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


<a name="develoment-environment"></a>

# Setting up a local development environment

After cloning this git repository you only need to run:

    $ ./bootstrap.sh


<a name="tests"></a>

## Running tests

    $ rake spec


<a name="lint"></a>

## Running lint

    $ rake lint
