#!/usr/bin/perl
use warnings;
use strict;
use Daemon::Control;

Daemon::Control->new({
    name        => "My Daemon",
    lsb_start   => '$syslog $remote_fs',
    lsb_stop    => '$syslog',
    lsb_sdesc   => 'My Daemon Short',
    lsb_desc    => 'My Daemon controls the My Daemon daemon.',
    path        => '/usr/sbin/mydaemon/init.pl',
    init_code   => "Test This\nOne Block",

    program     => sub { sleep shift },
    program_args => [ 10 ],

    pid_file    => '/tmp/mydaemon.pid',
    stderr_file => '/dev/null',
    stdout_file => '/dev/null',

})->run;
