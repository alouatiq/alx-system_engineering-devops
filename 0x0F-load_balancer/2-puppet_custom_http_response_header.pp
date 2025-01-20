class nginx_custom_header {
    # Ensure Nginx is installed
    package { 'nginx':
        ensure => installed,
    }

    # Manage Nginx default site configuration
    file { '/etc/nginx/sites-available/default':
        ensure  => file,
        content => template('nginx/default.erb'),
        notify  => Service['nginx'],
    }

    # Manage Nginx service
    service { 'nginx':
        ensure     => running,
        enable     => true,
        hasrestart => true,
    }
}

include nginx_custom_header
