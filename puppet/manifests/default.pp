Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }


class system-update {

    exec { 'apt-get update':
        command => 'apt-get update',
    }

    exec { 'install libfontconfig1':
        command => 'apt-get install libfontconfig1',
    }

}

class dev-packages {

    include gcc
    include wget

    $devPackages = [ "vim", "curl", "git","htop", "nodejs", "npm", "redis-server" ]
    
    package { $devPackages:
        ensure => "installed",
        require => Exec['apt-get update'],
    }

    exec { 'create alias for nodejs':
        command => 'ln -s /usr/bin/nodejs /usr/bin/node',
        require => Package["nodejs"],
        unless => "test -f /usr/bin/node"
    }

    exec { 'install nodemon globally with npm':
        command => 'npm install -g nodemon',
        require => Package["npm"],
    }

    exec { 'install gulp globally with npm':
        command => 'npm install -g gulp',
        require => Package["npm"],
    }

}


class { 'apt':
    always_apt_update    => true
}

Exec["apt-get update"] -> Package <| |>

include system-update
include dev-packages
