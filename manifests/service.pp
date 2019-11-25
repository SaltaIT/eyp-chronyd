class chronyd::service inherits chronyd {

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if versioncmp($::puppetversion, '4.0.0') < 0
  {

  }

  case $chronyd::service_ensure,
  {
    'masked':
    {
      # https://tickets.puppetlabs.com/browse/PUP-1253
      #TODO: detectar versio de puppet i escollir el metode

      exec { 'systemctl stop and mask chronyd':
        command => 'bash -c \'systemctl stop chronyd; systemctl mask chronyd\'',
        unless  => 'systemctl list-unit-files | grep "chronyd.service" | grep masked',
        path    => '/bin:/sbin:/usr/bin:/usr/sbin',
      }
    }
    default: { fail("unsupported chronyd::ensure: ${ensure}") }
  }


  if( $is_docker_container==false or
      $chronyd::manage_docker_service)
  {
    if($chronyd::manage_service)
    {
      service { $chronyd::params::service_name:
        ensure     => $chronyd::service_ensure,
        enable     => $chronyd::service_enable,
        hasstatus  => true,
        hasrestart => true,
      }
    }
  }
}
