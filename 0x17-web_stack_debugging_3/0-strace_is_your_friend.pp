# Fixing WordPress .phpp => .php bug and ensuring Apache is running
Exec { path => ['/bin','/usr/bin','/usr/sbin'] }

exec { 'fix-wordpress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  notify  => Service['apache2'],  # triggers Apache reload on change
}

service { 'apache2':
  ensure => 'running',
}
