class geoip2 (

  $root_path = '/opt/geoip2',

) inherits geoip2::params {

  anchor {'geoip2::begin':
    before => Class['geoip2::install']
  }
  class {'geoip2::install':
    require => Anchor['geoip2::begin']
  }
  class {'geoip2::config':
    require => Class['geoip2::install']
  }
  anchor {'geoip2::end':
    require => Class['geoip2::config']
  }
}
