class chronyd::config inherits chronyd {

  concat { '/etc/chrony.conf':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  concat::fragment{ 'base chrony':
    order   => '00',
    target  => '/etc/chrony.conf',
    content => template("${module_name}/chronyconf.erb"),
  }

}
