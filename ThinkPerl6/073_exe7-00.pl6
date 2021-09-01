#!/usr/bin/env perl6
#
# Looping and Counting
#
# The following program counts the number of times the letter “a” appears in a string:

say 'E:';
my $word = 'banana';
my $count = 0;
for $word.comb -> $letter {
    $count++ if $letter eq 'a';
}
say $count;
# -> 3

# This program demonstrates another pattern of computation called a counter. The
# variable $count is initialized to 0 and then incremented each time an “a” is found.
# When the loop exits, $count contains the result—the total number of occurrences of
# letter “a”.
#
# As an exercise, encapsulate this code in a subroutine named count , and generalize it
# so that it accepts the string and the searched letter as arguments. Solution: “Exercise:
# Counting the Letters of a String” on page 367.

