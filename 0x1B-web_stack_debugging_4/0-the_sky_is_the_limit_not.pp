# 0-the_sky_is_the_limit_not.pp
# This Puppet manifest optimizes the Nginx web server configuration to handle high request loads.

exec { 'optimize_nginx':
  command => 'sed -i "s/15/4069/" /etc/default/nginx && service nginx restart',
  unless  => 'grep "4069" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/:/usr/bin/',
}