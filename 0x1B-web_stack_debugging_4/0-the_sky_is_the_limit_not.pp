# 0-the_sky_is_the_limit_not.pp
# This Puppet manifest fixes Nginx so it can handle high concurrency and eliminate failed requests

package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  require    => Package['nginx'],
}

exec { 'fix_nginx_worker_connections':
  command => 'sed -i "s/worker_connections [0-9]\\+;/worker_connections 1024;/" /etc/nginx/nginx.conf && service nginx restart',
  unless  => 'grep "worker_connections 1024;" /etc/nginx/nginx.conf',
  require => Service['nginx'],
}