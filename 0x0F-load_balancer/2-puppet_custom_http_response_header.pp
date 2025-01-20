class nginx_custom_header {
    # Ensure Nginx is installed
    package { 'nginx':
        ensure => installed,
    }

    # Configure Nginx default site
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

    # Add the custom header
    exec { 'add_custom_header':
        command => '/bin/sed -i "/server_name _;/a \\tadd_header X-Served-By \$hostname;" /etc/nginx/sites-available/default',
        notify  => Service['nginx'],
        unless  => '/bin/grep -q "add_header X-Served-By" /etc/nginx/sites-available/default',
    }
}

include nginx_custom_header
