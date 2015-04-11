class docker_registry::repo ( $manage_repo = true ) {

  if $manage_repo {
    case $::osfamily {
      debian: {
        include ::apt
        apt::source { 'docker':
          location   => 'https://get.docker.com/ubuntu',
          include_src => false,
          repos      => 'docker main',
          release => '',
          key               => 'A88D21E9',
          key_server        => 'keyserver.ubuntu.com',
        }  
      }
      redhat: {
        include epel
      }
    }
  }
}

 
