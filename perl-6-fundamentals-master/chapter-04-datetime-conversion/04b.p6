#!/usr/bin/env perl6
use v6;

# Other types of junctions exist: any, all, none, and one. Considering that
# 0 is the only integer that is false in a boolean context, we could even write the
# preceding statement as

sub MAIN(Int $timestamp) {
    my $dt = DateTime.new(+$timestamp);

    if none($dt.hour, $dt.minute, $dt.second) {
        say $dt.Date;
    } else {
        say $dt;
    }
}
# Neat, right?

