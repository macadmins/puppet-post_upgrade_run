# puppet-post_upgrade_run

This module will deploy a script that runs at every boot that will verify that the OS version hasn't changed. If it has, it will run Puppet (by default `/opt/puppetlabs/bin/puppet agent -t`) so anything Apple has clobbered is rectified.

## Usage

Using a different command to run Puppet (a wrapper script, for example)

``` puppet
class {'post_upgrade_run':
    puppet_command => '/opt/mycompany/bin/puppet_run --now'    
}
```

Using Hiera

``` yaml
classes:
 - post_upgrade_run

post_upgrade_run::puppet_command: '/opt/mycompany/bin/puppet_run --now'
```
