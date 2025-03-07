# 0-the_sky_is_the_limit_not.pp
# This Puppet manifest configures Nginx & the OS to handle higher concurrency and eliminate failed requests

# 1. Ensure Nginx is installed and running
package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  subscribe  => Package['nginx'],  # if package updates, restart service
}

# 2. Raise OS file descriptor limits (helps prevent "Too many open files")
exec { 'increase_file_limits':
  command => 'echo "* soft nofile 65536" >> /etc/security/limits.conf &&
              echo "* hard nofile 65536" >> /etc/security/limits.conf &&
              sed -i "s/^#\\?session required pam_limits.so/session required pam_limits.so/" /etc/pam.d/common-session &&
              sed -i "s/^#\\?session required pam_limits.so/session required pam_limits.so/" /etc/pam.d/common-session-noninteractive',
  unless  => 'grep "65536" /etc/security/limits.conf',
}

# 3. Increase worker_connections in Nginx config
#    Use a generic regex so we replace any existing value
exec { 'increase_nginx_worker_connections':
  command => 'sed -i "s/worker_connections [0-9]\\+;/worker_connections 4096;/" /etc/nginx/nginx.conf',
  unless  => 'grep "worker_connections 4096;" /etc/nginx/nginx.conf',
  require => [ Package['nginx'], Exec['increase_file_limits'] ],
}

# 4. Restart Nginx only if config changed
exec { 'restart_nginx':
  command     => '/usr/sbin/service nginx restart',
  refreshonly => true,
  subscribe   => Exec['increase_nginx_worker_connections'],
}