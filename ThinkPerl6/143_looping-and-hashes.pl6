#!/usr/bin/env perl6
#
# Looping and Hashes
#
# If you use a hash in a for statement, it traverses the pairs of the hash:

say 'A:';
my %eng2sp = <one uno two dos three tres>;
for %eng2sp -> $pair { say $pair}
# two => dos
# three => tres
# one => uno
#
# We have named the iteration variable $pair to point out more clearly that the pro‐
# gram is iterating over key-value pairs (actually Pair objects). You may use the key
# and value (notice the singular) methods to access the key and value of a Pair. For
# example, to reverse the order in which each line is printed:

say 'B:';
for %eng2sp -> $pair { say $pair.value ~ " <= " ~ $pair.key; }
# dos <= two
# tres <= three
# uno <= one

# Again, the keys are in no particular order. To traverse the keys in sorted order, you
# can use the keys (plural) and sort functions or methods:

say 'C:';
sub histogram (Str $string) {
    my %histo;
    for $string.comb -> $letter {
        %histo{$letter}++;
    }
    return %histo;
}

my %histo = histogram("We all live in a yellow submarine");
for %histo.keys.sort -> $key {
    say "$key\t%histo{$key}";
}

