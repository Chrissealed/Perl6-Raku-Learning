#!/usr/bin/env perl6

# Think Perl6 chapter 1 exercises

say 'A:';
# How many seconds are there in 42 minutes, 42 seconds ?
my $seconds = 60;
my $minutes = 42;
my $total = $seconds * $minutes + 42;
say "There are " ~ $total ~ " seconds in 42m,42s";

say 'B:';
# How many miles are there in 10 kilometers ?
# Hint: there are 1.61 kilometers in a mile.
my $mile = 1.61;
my $kms = 10;
$total = $mile * $kms;
say "There are " ~ $total ~ " miles in 10km";

say 'C:';
# If you run a 10-kilometer race in 42 minutes, 42 seconds,
# what is your average pace (time per mile in minutes and seconds) ?
my $time = 42.42;
my $time-per-mile = $time / $total;
say "Time per mile : " ~ $time-per-mile ~ "mn";
# What is your average speed in miles per hour ?
my $average-speed = $total * 60 / $time;
say "Average speed : " ~ $average-speed ~ " miles per hour";

