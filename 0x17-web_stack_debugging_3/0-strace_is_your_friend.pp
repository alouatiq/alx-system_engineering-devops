# Fixing WordPress 500 errors
Exec { path => ['/bin','/usr/bin','/usr/sbin'] }

package { 'apache2':
  ensure => installed,
}

package { ['php5', 'php5-mysql']:
  ensure  => installed,
  require => Package['apache2'],
}

service { 'apache2':
  ensure  => running,
  enable  => true,
  require => [ Package['apache2'], Package['php5'], Package['php5-mysql'] ],
}

exec { 'fix-wordpress-permissions':
  command => 'chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html',
  onlyif  => 'test -d /var/www/html',
  require => Service['apache2'],
}

exec { 'enable-mod-rewrite':
  command => 'a2enmod rewrite && service apache2 restart',
  unless  => 'test -L /etc/apache2/mods-enabled/rewrite.load',
  require => Service['apache2'],
}
