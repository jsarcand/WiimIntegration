package Plugins::WiimIntegration::CastProto;

use strict;
use warnings;

# A Lyrion preset plays a URL. wiimcast://<wiim mac> is that URL: the player
# which opens it is the destination, and the cast is the same one as Écouter.
# explodePlaylist must finish the playlist command without queueing this URL
# as audio. The cast replaces the queue once AudioCast is ready.

sub isRemote   { 1 }
sub isPlaylist { 1 }

sub explodePlaylist {
    my ($class, $client, $url, $cb) = @_;
    my ($mac) = ($url || '') =~ m{^wiimcast://([0-9a-f:]+)}i;
    $mac = lc($mac || '');

    if ($client && $mac) {
        Slim::Utils::Timers::setTimer($client, Time::HiRes::time() + 0.1, sub {
            my $dest = shift || return;
            Plugins::WiimIntegration::Plugin::playWiimCast($dest, $mac);
        });
    }

    # Empty list: this command clears the previous queue and adds nothing.
    # playWiimCast fills it after speaker_enable.
    $cb->([]) if $cb;
    return [];
}

1;
