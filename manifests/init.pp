# = Class: limits_conf
#
# == Requires:
#
# Only tested on RHEL5 and RHEL6
#
# == Sample Usage:
#
# limits_conf::set {
#     'soft-nproc':     item => 'nproc',    value => '16384';
#     'soft-nofile':    item => 'nofile',   value => '65536';
#     'hard-nproc':     item => 'nproc',    value => '16384',   type => 'hard';
#     'hard-nofile':    item => 'nofile',   value => '65536',   type => 'hard';
# }

class limits_conf {

    file { '/etc/security/limits.conf':
        ensure => present,
    }
}
