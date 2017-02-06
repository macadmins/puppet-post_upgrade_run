# Class: post_upgrade_run::install
#
#
class post_upgrade_run::install {
  $puppet_command = $post_upgrade_run::puppet_command
  if !defined(File['/Library/Application Support/Management']){
    file {'/Library/Application Support/Management':
      ensure => 'directory',
    }
  }

  if !defined(File['/Library/Application Support/Management/bin']){
    file {'/Library/Application Support/Management/bin':
      ensure => 'directory',
    }
  }

  file { '/Library/Application Support/Management/bin/post_upgrade_run.py':
    ensure  => 'present',
    owner   => 'root',
    group   => 'wheel',
    mode    => '0755',
    content => template('post_upgrade_run/post_upgrade_run.py.erb'),
  }

  file {'/Library/LaunchDaemons/org.macadmins.post_upgrade_run.plist':
    ensure => 'present',
    owner  => 'root',
    group  => 'wheel',
    mode   => '0644',
    source => 'puppet:///modules/post_upgrade_run/org.macadmins.post_upgrade_run.plist'
  }
}
