# refclock PHC /dev/ptp0 poll 3 dpoll -2 offset 0
define chronyd::refclock(
                          $driver,
                          $refclock_name   = $name,
                          $order           = '01',
                          $poll            = undef,
                          $dpoll           = undef,
                          $offset          = undef,
                          $trust           = false,
                          $prefer          = false,
                          $required_source = false,
                          $description     = undef,
                        ) {

  # https://docs.microsoft.com/en-us/azure/virtual-machines/linux/time-sync
  concat::fragment{ "refclock ${driver} ${refclock_name}":
    order   => "10-${order}",
    target  => '/etc/chrony.conf',
    content => template("${module_name}/refclock.erb"),
  }
}
