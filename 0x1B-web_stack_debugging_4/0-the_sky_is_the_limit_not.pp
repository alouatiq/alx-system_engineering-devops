# 0-the_sky_is_the_limit_not.pp
# This Puppet manifest configures Nginx to handle higher concurrency with minimal failed requests

exec { 'fix_nginx_worker_config':
  command => 'sed -i "s/worker_processes .*/worker_processes auto;/" /etc/nginx/nginx.conf && \
              sed -i "s/worker_connections .*/worker_connections 4096;/" /etc/nginx/nginx.conf && \
              service nginx restart',
  unless  => 'grep -q "worker_processes auto;" /etc/nginx/nginx.conf && grep -q "worker_connections 4096;" /etc/nginx/nginx.conf',
}