class chronyd::install inherits chronyd {

  if($chronyd::manage_package)
  {
    package { $chronyd::params::package_name:
      ensure => $chronyd::package_ensure,
    }
  }

}
