# This Puppet manifest raises the Nginx worker connections to handle more requests concurrently.

exec { 'fix_nginx_worker_connections':
  command => 'sed -i "s/worker_connections 768;/worker_connections 1024;/" /etc/nginx/nginx.conf && service nginx restart',
  unless  => 'grep "worker_connections 1024;" /etc/nginx/nginx.conf',
}

exec { 'reload_nginx':
  command     => 'service nginx reload',
  refreshonly => true,
  subscribe   => Exec['fix_nginx_worker_connections'],
}