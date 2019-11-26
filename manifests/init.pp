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
                $logdir                = '/var/log/chrony',
                $log_measurements      = false,
                $log_statistics        = false,
                $log_tracking          = false,
                $log_rtc               = false,
                $log_refclocks         = false,
                $log_tempcomp          = false,
                $allow                 = [],
                $local_stratum         = undef,
                $minsources            = '2',
                $driftfile             = '/var/lib/chrony/drift',
                $rtcsync               = true,
                $makestep_offset       = '1.0',
                $makestep_runs         = '3',
              ) inherits chronyd::params {

  class { '::chronyd::install': } ->
  class { '::chronyd::config': } ~>
  class { '::chronyd::service': } ->
  Class['::chronyd']

}
