#!/usr/bin/env perl6
#
# Common Operations on Hashes
#
# We’ve seen already that to populate a hash, you can just assign an even list to it. The
# four syntactical forms below are correct:

say 'A:';
my %first_quarter = ("jan" => 1, "feb" => 2, "mar" => 3);
say %first_quarter;
my %second_quarter = (apr => 4, may => 5, jun => 6);
say %second_quarter;
my %third_quarter = jul => 7, aug => 8, sep => 9;
say %third_quarter;
my %fourth_quarter = < oct 10 nov 11 dec 12 >;
say %fourth_quarter;

# To add an element to a hash, just assign the hash with a key:

say 'B:';
my %months = ("jan" => 1, "feb" => 2, "mar" => 3);
%months{'apr'} = 4;
say %months; # -> apr => 4, feb => 2, jan => 1, mar => 3

# Remember that you can also do the same without having to quote the keys if you use
# the angle brackets quote-word operator (if the keys are strings):

%months<apr> = 4; # same as: %months{'apr'} = 4;

# or you can also use the push function with a pair:

say 'C:';
push %months, (may => 5);
say %months;
# apr => 4, feb => 2, jan => 1, mar => 3, may => 5
my $new-pair = jun => 6;
say $new-pair;
# jun => 6
push %months, $new-pair;
say %months;
# apr => 4, feb => 2, jan => 1, jun => 6, mar => 3, may => 5

# Using push to add a pair to a hash is not exactly the same, though, as making a hash
# assignment: if the key already exists, the old value is not replaced by the new one—
# instead, the old and the new ones are placed into an array (or, if the old value is
# already an array, then the new value is added to the array):

say 'D:';
push %months, (jan => '01');
say %months;
# {apr => 4, feb => 2, jan => [1 01], jun => 6, mar => 3, may => 5}

# To check whether a value is defined for a given key, use defined :

say 'E:';
say True if defined %months<apr>; # True

# To obtain the number of items in a hash, use the elems method:

say 'F:';
say %months.elems; # -> 6

# To remove a hash item, use the :delete adverb:

say 'G:';
push %months, (jud => 7); # Oops, a typo!
say %months;
# apr => 4, feb => 2, jan => 1, jud => 7, jun => 6, mar => 3, may => 5
%months{'jud'}:delete; # typo now removed
# 7
say %months;
# apr => 4, feb => 2, jan => 1, jun => 6, mar => 3, may => 5

# Note that the :delete adverb also returns the value that is being removed.
#
# To iterate over a hash, use:
# • kv to retrieve the interleaved keys and values
# • keys to retrieve the keys
# • values to retrieve the values
# • pairs to retrieve the key-value pairs
#
# For example:

say 'H:';
for %months.kv -> $key, $val { say "$key => $val" }
# jan => 1
# apr => 4
# mar => 3
# jun => 6
# may => 5
# feb => 2
say keys %months;
# (jan apr mar jun may feb)
say values %months;
# (1 4 3 6 5 2)
say %months.pairs;
# (jan => 1 apr => 4 mar => 3 jun => 6 may => 5 feb => 2)

