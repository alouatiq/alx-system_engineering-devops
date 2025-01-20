# 2-puppet_custom_http_response_header.pp

# Ensure Nginx is installed
package { 'nginx':
  ensure => installed,
}

# Modify the Nginx configuration to add the custom header
file { '/etc/nginx/nginx.conf':
  ensure  => file,
  content => template('nginx/nginx.conf.erb'),
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Restart Nginx to apply the changes
service { 'nginx':
  ensure    => running,
  enable    => true,
  require   => Package['nginx'],
  subscribe => File['/etc/nginx/nginx.conf'],
}

# Template for Nginx configuration
file { '/etc/nginx/nginx.conf.erb':
  ensure  => file,
  content => epp('nginx/nginx.conf.epp'),
  require => Package['nginx'],
}

# Template content for Nginx configuration
file { 'nginx/nginx.conf.epp':
  ensure  => file,
  content => @(END),
    user www-data;
    worker_processes auto;
    pid /run/nginx.pid;
    include /etc/nginx/modules-enabled/*.conf;

    events {
      worker_connections 768;
    }

    http {
      include /etc/nginx/mime.types;
      default_type application/octet-stream;

      server {
        listen 80;
        server_name _;

        location / {
          add_header X-Served-By <%= $::hostname %>;
          root /var/www/html;
          index index.html index.htm;
        }
      }
    }
    | END,
  require => Package['nginx'],
}
