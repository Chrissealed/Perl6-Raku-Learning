#!/usr/bin/env perl6
#
# Exercise 11-6.
# Write a program that uses this algorithm to choose a random word from emma.txt.
# Solution: “Exercise: Random Words” on page 410.
# Note that Perl offers a shortcut to perform the task at hand: when used on a bag, pick
# returns a random selection of elements, weighted by the values corresponding to each
# key. Ideally, we should have used a bag instead of a hash to store our %histo histo‐
# gram, but we did not know about bags at the time. We can, however, construct a bag
# from the %histo histogram. Consider the following example:
# > my %histo = ( banana => 5, pear => 1, orange => 12);
# {banana => 5, orange => 12, pear => 1}
# > my $fruit-bag = bag map { $_ xx %histo{$_}}, %histo.keys;
# bag(banana(5), orange(12), pear)
# > for 1..10 { say $fruit-bag.pick: 5}
# (banana orange orange orange orange)
# (orange orange banana orange banana)
# (orange orange banana orange orange)
# (pear orange banana banana orange)
# (orange banana orange orange orange)
# ...
# As you can see, the most common item, “orange,” has been picked more often than
# the others, and the least common, “pear,” has not been picked up at all before the
# fourth draw.
#
# As an exercise, you may want to adapt this code to choose random words from
# emma.txt.

