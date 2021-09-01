#!/usr/bin/env perl6
#
# Hash as a Collection of Counters
#
# Suppose you are given a string and you want to count how many times each letter
# appears. There are several ways you could do it:
#
# • You could create 26 variables, one for each letter of the alphabet. Then you could
# traverse the string and, for each character, increment the corresponding counter,
# probably using an ugly and huge 26-part chained conditional.
#
# • You could create an array with 26 elements. Then you could convert each charac‐
# ter to a number (using the built-in function ord), use the number as an index
# into the array, and increment the appropriate counter.
#
# • You could create a hash with characters as keys and counters as the correspond‐
# ing values. The first time you see a character, you would add an item to the hash.
# After that, you would increment the value of an existing item.
#
# Each of these options performs the same computation, but each of them implements
# that computation in a different way.
#
# An implementation is a way of performing a computation; some implementations are
# better than others. For example, an advantage of the hash implementation is that we
# don’t have to know ahead of time which letters appear in the string and we only have
# to make room for the letters that do appear.
#
# Here is what the code might look like:

sub histogram (Str $string) {
    my %histo;
    for $string.comb -> $letter {
        %histo{$letter}++;
    }
    return %histo;
}

# The name of the function is histogram , which is a statistical term for a collection of
# counters (or frequencies).
# The first line of the function creates an empty hash. The for loop traverses the string.
# Each time through the loop, if the character $letter is not in the hash, Perl creates a
# new item with key $letter and defaults the values to 0 when the “++” operator is
# called on it, so that the first value immediately thereafter is 1. If $letter is already in
# the hash, the value is incremented.
#
# Here’s how it works:

say histogram("We all live in a yellow submarine");
# W => 1, a => 3, b => 1, e => 4, i => 3, l => 5, (...) y => 1

# The histogram indicates that the letters 'W' and 'b' appear only once; 'a' and 'i'
# appear three times, 'e' appears four times, and so on.

