# 0-the_sky_is_the_limit_not.pp
# This Puppet manifest raises the Nginx worker connections to handle more requests concurrently

exec { 'fix--for-nginx':
  command => 'sed -i "s/worker_connections 768;/worker_connections 1024;/" /etc/nginx/nginx.conf && service nginx restart',
}
