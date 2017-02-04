# Runs Puppet after a macOS upgrade
class post_upgrade_run (
  String $puppet_command = '/opt/puppetlabs/bin/puppet agent -t'
  ) {
  class {'post_upgrade_run::install': } ->
  # class {'post_upgrade_run::service': } ->
  Class['post_upgrade_run']
}
