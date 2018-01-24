# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class chronyd ($ensure='masked') inherits chronyd::params {

  Exec {
		path => '/bin:/sbin:/usr/bin:/usr/sbin',
	}

  case $ensure
  {
    'masked':
    {
      #https://tickets.puppetlabs.com/browse/PUP-1253
      #TODO: detectar versio de puppet i escollir el metode

      exec { 'systemctl stop and mask chronyd':
        command => 'bash -c \'systemctl stop chronyd; systemctl mask chronyd\'',
        unless => 'systemctl list-unit-files | grep "chronyd.service" | grep masked',
      }
    }
    default: { fail("unsupported chronyd::ensure: ${ensure}") }
  }

}
