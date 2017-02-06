# Set up the service for the good stuff
class post_upgrade_run::service {
  service {'org.macadmins.post_upgrade_run':
    ensure => 'running',
    enable => true
  }
}
