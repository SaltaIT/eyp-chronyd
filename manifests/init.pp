# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class chronyd (
                $manage_package        = true,
                $package_ensure        = 'installed',
                $manage_service        = true,
                $manage_docker_service = true,
                $service_ensure        = 'running',
                $service_enable        = true,
              ) inherits chronyd::params {




  # /etc/chrony.conf

  # https://docs.microsoft.com/en-us/azure/virtual-machines/linux/time-sync
  # refclock PHC /dev/ptp0 poll 3 dpoll -2 offset 0


}
