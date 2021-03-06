class docker_registry::python (

  $ensure_package,
  $aws_secret_key_id,
  $aws_secret_access_key,
  $aws_bucket,

){

  class { ::python:
    version    => 'system',
    pip        => true,
    dev        => true,
    virtualenv => true,
    gunicorn   => true,
  }

}
