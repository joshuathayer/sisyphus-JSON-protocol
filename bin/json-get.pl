#!/usr/bin/perl

use strict;
use AnyEvent::Strict;
use Sisyphus::Connector;
use Data::Dumper;

my $c = Sisyphus::Connector->new();
$c->{host} = '127.0.0.1';
$c->{port} = 5051;
$c->{protocolName} = "JSON";
my $cv = AnyEvent->condvar;

$c->{app_callback} = sub {
	my $dat = shift;

	print "received from server:\n";
	print Dumper $dat;

	$cv->send;
};


$c->connect(sub{
	my $message = {
        command => "getLocation",
        #uuid => "5D4CE360-A1F3-11DF-8CFD-D2BF6DDC1387",
        Abbreviation => "sea",
        cols => ["hostname", "uuid"],
	};

	$c->send($message);
});

$cv->recv;
