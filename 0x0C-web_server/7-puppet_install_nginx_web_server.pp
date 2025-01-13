class nginx {
    package { 'nginx':
        ensure => installed,
    }

    service { 'nginx':
        ensure => running,
        enable => true,
    }

    file { '/var/www/html/index.html':
        ensure  => file,
        content => 'Hello World!',
    }

    file { '/etc/nginx/sites-available/default':
        ensure  => file,
        content => template('nginx/default.erb'),
        notify  => Service['nginx'],
    }
}

class { 'nginx': }
