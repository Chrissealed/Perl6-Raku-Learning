#!/usr/bin/env perl6
#
# Hashes and Arrays
#
# Inverting a hash can be very easy if it is known that the values can happen only once
# (that they are unique). Consider for example a hash mapping months to their number
# in the year (we limit the example to five months for brevity):

say 'A:';
say my %months = jan => 1, feb => 2, mar => 3, apr => 4, may => 5;
# apr => 4, feb => 2, jan => 1, mar => 3, may => 5

# We can transform the key-value pairs into a flat list, reverse the list, and assign the
# reversed list to a new hash:

say my %rev_months = %months.kv.reverse;
# 1 => jan, 2 => feb, 3 => mar, 4 => apr, 5 => may

# We now have a new hash mapping month numbers to their names. This can be very
# handy if a hash is known to be bijective, but this approach does not work correctly if
# a value can happen more than once: in such a case, some pairs will be lost:

say 'B:';
say %months = jan => 1, january => 1, feb => 2, february => 2;
# feb => 2, february => 2, jan => 1, january => 1
say %rev_months = %months.kv.reverse;
# january => 1, 2 => february

# Arrays can appear as values in a hash. For example, if you are given a hash that maps
# from letters to frequencies, you might want to invert it; that is, create a hash that
# maps from frequencies to letters. Since there might be several letters with the same
# frequency, each value in the inverted hash should probably be an array of letters.
#
# Here is a function that inverts such a hash:

say 'C:';
sub invert-hash (%in-hash) {
    my %out-hash;
    for %in-hash.kv -> $key, $val {
        push %out-hash{$val}, $key;
    }
    return %out-hash;
}

sub histogram (Str $string) {
    my %histo;
    for $string.comb -> $letter {
        %histo{$letter}++;
    }
    return %histo;
}

# Each time through the loop, a hash item is assigned to the $key and $val variables,
# and $key is appended to the value %output-hash for the $val key; if that value does
# not exist yet, it is created. At the end of the process, the values of %output-hash are all
# anonymous arrays.
#
# Here is an example:

my %rev-hist = invert-hash histogram 'parrot';
say %rev-hist;
dd %rev-hist;

# This will display:
# 1 => [p a o t], 2 => [r]
# Hash %rev-hist = {"1" => $["p", "a", "o", "t"], "2" => $["r"]}
#
# Notice that the say function gives a simple representation of the hash data, and that
# the new dd (short for “data dumper”) function used here gives more detailed infor‐
# mation. dd is not very commonly used in normal programs, but can be quite useful
# while debugging a program to display a detailed description of a complex data
# structure. (2)
#
# 2) To tell the full truth, dd is not standard Perl 6, it is a Rakudo-specific debugging feature.
# A future implementation of Perl 6 not based on Rakudo might not have it.
#
# %output-hash contains two items (two pairs) whose values are anonymous arrays.
# You can access the second element of the first array using the hash value %rev-
# hist{"1"} as if it was any ordinary array name, with this simple syntax:

say 'D:';
say %rev-hist{"1"}[1]; # -> a

# Figure 10-1 is a state diagram showing %hist and %rev-hist. A hash is represented as
# a box with the type hash above it and the key-value pairs inside.
#
# Arrays can be values in a hash, as this example shows, but they cannot be keys. If you
# try, you’re likely to end up with a key that contains only one item of the array, but
# most likely not what you intended:

say 'E:';
my @a = 'a' .. 'c';
my %h;
%h{@a} = 5;
say %h; # -> a => 5, b => (Any), c => (Any)

# Here, Perl interpreted the %h{@a} = 5; assignment as a slice assignment, i.e., it
# assumed that we were trying to populate three items in one go, one for each element
# of the array.
#
# As mentioned earlier, a hash is implemented using a hashing function and that means
# that the keys have to be hashable. (3) A hashing function is a function that takes a value
# (of any kind) and returns an integer. Hashes use these integers, called hash values, to
# store and look up key-value pairs.
#
# 3) This is not entirely true. The keys of a “normal” hash must be hashable and therefore immutable.
# There is another type of hash, object hashes, for which the need to have immutable keys does not apply.
#
# This system works fine if the keys are immutable. But if the keys are mutable, like
# with arrays, bad things would happen. For example, when you create a key-value pair,
# Perl would hash the key and store it in the corresponding location. If you modify the
# key and then hash it again, it would go to a different location. In that case, you might
# have two entries for the same key, or you might not be able to find a key. Either way,
# the hash wouldn’t work correctly.
#
# That’s why keys have to be hashable, and why mutable types like arrays aren’t. So Perl
# will do something else that can be useful (such as creating three distinct hash items in
# the example above), but will not hash the array itself.
#
# Since hashes are mutable, they can’t be used as keys, but they can be used as values, so
# that you can have nested hashes.

