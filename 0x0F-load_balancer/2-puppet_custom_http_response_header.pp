package { 'nginx':
  ensure => installed,
}

file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => @("EOF"),
    server {
        listen 80;
        server_name _;

        location / {
            add_header X-Served-By \$hostname;
            root /var/www/html;
            index index.html index.htm;
        }
    }
    | EOF
  require => Package['nginx'],
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  require    => Package['nginx'],
}
