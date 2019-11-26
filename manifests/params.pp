class chronyd::params {

  $package_name = 'chrony'
  $service_name = 'chronyd'

  case $::osfamily
  {
    'redhat' :
    {
      case $::operatingsystemrelease
      {
        /^[78].*$/:
        {
        }
        default: { fail('Unsupported RHEL/CentOS version!')  }
      }
    }
    default  : { fail('Unsupported OS!') }
  }
}
