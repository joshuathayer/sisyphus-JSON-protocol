#!/usr/bin/perl

use strict;

use Sisyphus::Listener;
use Sisyphus::Proto::JSON;
use AnyEvent::Strict;
use ExampleJSONApplication;

my $listener = new Sisyphus::Listener;

$listener->{port} = 8889;
$listener->{ip} = "127.0.0.1";
$listener->{protocol} = "Sisyphus::Proto::JSON";
$listener->{application} = ExampleJSONApplication->new();
$listener->listen();

AnyEvent->condvar->recv;

