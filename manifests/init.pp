# = Class: limits_conf
#
# == Requires:
#
# Only tested on RHEL5 and RHEL6
#
# == Sample Usage:
#
# class { 'limits_conf': }

class limits_conf {

    file { '/etc/security/limits.conf':
        ensure => present,
    }
}
