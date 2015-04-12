# == Class: docker_registry
#
# Full description of class docker_registry here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'docker_registry':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class docker_registry (

  $manage_python        = true,
  $aws_secret_key_id    = undef,
  $aws_secret_acess_key = undef,
  $aws_bucket           = undef,

){
  
  class { ::docker: }
  ->
  class { ::docker_registry::python: 
    manage_python         => $manage_python,
 }
  ->
  class { ::docker_registry::service:
    aws_secret_key_id     => $aws_secret_key_id,
    aws_secret_access_key => $aws_secret_access_key,
    $aws_bucket           => $aws_bucket,
  }

}
