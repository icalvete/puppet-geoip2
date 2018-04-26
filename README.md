# puppet-geoip2

Puppet manifest to install and configure MaxMind GeoIP 2

[![Build Status](https://secure.travis-ci.org/icalvete/puppet-geoip2.png)](http://travis-ci.org/icalvete/puppet-geoip2)

See [MaxMind site](http://dev.maxmind.com/geoip/geolite/)


This manifest install GeoIP 2 (Country Level)

## Usage

By default in /opt/geoip2

```puppet
include geoip2
```

```puppet
class {'geoip2':
  root_path => '/srv/geoip2/'
}
```

## Update

This manifest also install crons to update databases.

## Authors:

Israel Calvete Talavera <icalvete@gmail.com>
