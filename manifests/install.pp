class geoip2::install {

  file { 'geoip2_root_path':
    ensure => directory,
    path   => $geoip2::root_path,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  exec { 'download_geoip2_city_database':
    command  => "/usr/bin/curl -s http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz | tar xvfz - -C ${geoip2::root_path} --wildcards --no-anchored --strip-components 1 '*mmdb",
    user     => 'root',
    provider => 'shell',
    require  => File['geoip_root_path'],
    unless   => "/usr/bin/test -d ${geoip2::root_path}"
  }

  cron { 'update__geoip2_database':
    command => "/usr/bin/flock /tmp/update_geoip2_database /usr/bin/curl -s http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz | tar xvfz - -C ${geoip2::root_path} --wildcards --no-anchored --strip-components 1 '*mmdb",
    user    => 'root',
    hour    => '0',
    minute  => '0',
    weekday => '7'
  }
}
