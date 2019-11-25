class chronyd::config inherits chronyd {

  file { '/etc/chrony.conf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/chronyconf.erb"),
  }

}
