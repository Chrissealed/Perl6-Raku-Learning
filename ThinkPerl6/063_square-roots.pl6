#!/usr/bin/env perl6
#
# Square Roots
#
# Loops are often used in programs that compute numerical results by starting with an
# approximate answer and iteratively improving it.
# For example, one way of computing square roots is Newton’s method (also known as
# the Newton–Raphson method). Suppose that you want to know the square root of a.
# If you start with almost any estimate, x, you can compute a better estimate y with the
# following formula:
#
# y = (x + a/x) / 2
#
# For example, if a is 4 and x is 3:

my $a = 4;
# 4
my $x = 3;
# 3
my $y = ($x + $a/$x)/2;
say $y;

# 2.166667
# The result is closer than 3 to the correct answer (4 = 2). If we repeat the process
# with the new estimate, it gets even closer:

$x = $y;
# 2.166667
$y = ($x + $a/$x)/2;
say $y;

# 2.006410
# After a few more updates, the estimate is almost exact:

$x = $y;
# 2.006410
$y = ($x + $a/$x)/2;
# 2.000010
$x = $y;
# 2.000010
$y = ($x + $a/$x)/2;
# 2.000000000026
#
# In general we don’t know ahead of time how many steps it takes to get to the right
# answer, but we know when we get there because the estimate stops changing:

$x = $y;
# 2.000000000026
$y = ($x + $a/$x)/2;
# 2
$x = $y;
# 2
$y = ($x + $a/$x)/2;
# 2
#
# When $y == $x, we can stop. Here is a loop that starts with an initial estimate, x, and
# improves it until it stops changing:

($a, $x) = (4, 3);
while True {
    say "-- Intermediate value: $x";
    my $y = ($x + $a/$x) / 2;
    last if $y == $x;
    $x = $y;
}
say "Final result is $x";

# This will print:
# -- Intermediate value: 2
# -- Intermediate value: 3
# -- Intermediate value: 2.166667
# -- Intermediate value: 2.006410
# -- Intermediate value: 2.000010
# -- Intermediate value: 2.000000000026
# Final result is 2
#
# For most values of $a this works fine, but there are a couple of caveats with this
# approach. First, in most programming languages, it is dangerous to test float equal‐
# ity, because floating-point values are only approximately right. We do not have this
# problem with Perl 6, because, as we have already mentioned, it is using a better repre‐
# sentation of rational numbers than most generalist programming languages. (You
# may want to keep this in mind if you are using some other languages.) Even if we
# don’t have this problem with Perl, there may also be some problems with algorithms
# that do not behave as well as Newton’s algorithm. For example, some algorithms
# might not converge as fast and as neatly as Newton’s algorithm but might instead pro‐
# duce alternate values above and below the accurate result.
# Rather than checking whether $x and $y are exactly equal, it is safer to use the built-
# in function abs to compute the absolute value, or magnitude, of the difference
# between them:

my $epsilon = 0.0000001;
($a, $x) = (4, 3);
while True {
    say "-- Intermediate value: $x";
    my $y = ($x + $a/$x) / 2;
    last if abs($y - $x) < $epsilon;
    $x = $y;
}
say "Final result is $x";

# where epsilon has a very small value like 0.0000001 that determines how close is
# close enough.

