#Puppet manifest to modify the line "PermitRootLogin yes" to "PermitRootLogin no" or vice versa in /etc/ssh/sshd_config



augeas { "sshd_config":
  context => "/files/etc/ssh/sshd_config",
  changes => [
    "set PermitRootLogin no",
  ],
  notify  => Service["sshd"],
        }
            service { "sshd":
            ensure  => "running",
            enable  => "true",

          }


