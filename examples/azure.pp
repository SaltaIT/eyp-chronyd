class { 'chronyd':
}

# refclock PHC /dev/ptp0 poll 3 dpoll -2 offset 0
chronyd::refclock { '/dev/ptp0':
  driver => 'PHC',
  poll   => '3',
  dpoll  => '-2',
  offset => '0',
}
