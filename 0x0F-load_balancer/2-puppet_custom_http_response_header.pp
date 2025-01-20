file { '/etc/nginx/sites-available/default':
    ensure  => file,
    content => template('nginx_default_config.erb'),
    notify  => Service['nginx'],
}

service { 'nginx':
    ensure     => running,
    enable     => true,
    hasrestart => true,
}
