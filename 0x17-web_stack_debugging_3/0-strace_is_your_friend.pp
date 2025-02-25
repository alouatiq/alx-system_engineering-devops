# Fix the WordPress 500 error by installing missing packages, setting permissions, and enabling mod_rewrite
package { ['php5', 'php5-mysql']:
  ensure => installed,
}

service { 'apache2':
  ensure  => running,
  enable  => true,
  require => Package['php5'],
}

exec { 'fix-wordpress-permissions':
  command => 'chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html',
  path    => ['/bin', '/usr/bin'],
  onlyif  => 'test -d /var/www/html',
  require => Service['apache2'],
}

exec { 'enable-mod-rewrite':
  command => 'a2enmod rewrite && service apache2 restart',
  path    => ['/bin', '/usr/bin'],
  unless  => 'test -L /etc/apache2/mods-enabled/rewrite.load',
  require => Service['apache2'],
}
