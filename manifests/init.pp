class virtualbox(
  $ubuntu_release
) {
  apt::source { virtualbox:
    location    => 'http://download.virtualbox.org/virtualbox/debian',
    release     => $ubuntu_release,
    repos       => 'contrib',
    key         => '98AB5139',
    key_source  => "http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc",
    include_src => false,
  }
  package { virtualbox:
    name => 'virtualbox-4.2',
    ensure => present,
    require => Apt::Source['virtualbox']
  }
}
