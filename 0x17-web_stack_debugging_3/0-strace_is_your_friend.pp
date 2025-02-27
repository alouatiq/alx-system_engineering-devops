# This Puppet manifest fixes the WordPress 500 error by installing Apache/PHP, fixing .phpp typo, and enabling mod_rewrite

# Ensures all Exec resources can find commands like a2enmod in /usr/sbin
Exec { path => ['/bin', '/usr/bin', '/usr/sbin'] }

# 1) Make sure Apache is installed
package { 'apache2':
  ensure => installed,
}

# 2) Install PHP5 and MySQL extension for Ubuntu 14.04
package { ['php5', 'php5-mysql']:
  ensure  => installed,
  require => Package['apache2'],
}

# 3) Ensure Apache service is running
service { 'apache2':
  ensure  => running,
  enable  => true,
  require => [ Package['apache2'], Package['php5'], Package['php5-mysql'] ],
}

# 4) Fix the .phpp -> .php typo in wp-settings.php
exec { 'fix-wordpress-typo':
  command => '/bin/sed -i "s/class-wp-locale.phpp/class-wp-locale.php/g" /var/www/html/wp-settings.php',
  onlyif  => 'grep -q "class-wp-locale.phpp" /var/www/html/wp-settings.php',
  notify  => Service['apache2'],
}

# 5) Set correct ownership & permissions for WordPress files
exec { 'fix-wordpress-permissions':
  command => 'chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html',
  onlyif  => 'test -d /var/www/html',
  require => Service["apache2"],
}

# 6) Enable mod_rewrite (common WordPress requirement)
exec { 'enable-mod-rewrite':
  command => 'a2enmod rewrite && service apache2 restart',
  unless  => 'test -L /etc/apache2/mods-enabled/rewrite.load',
  require => Service["apache2"],
}
