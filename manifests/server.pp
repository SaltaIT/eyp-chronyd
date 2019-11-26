define chronyd::server(
                        $description = $name,
                        $servers     = [],
                        $iburst      = true,
                        $order       = '42',
                      ) {
  concat::fragment{ "server ${servers} ${description}":
    order   => "20-${order}",
    target  => '/etc/chrony.conf',
    content => template("${module_name}/server.erb"),
  }
}
