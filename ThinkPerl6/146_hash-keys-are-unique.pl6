#!/usr/bin/env perl6
#
# Hash Keys Are Unique
#
# It is not possible to have the same key in a hash more than once. Trying to map a new
# value to a key will replace the old value with the new one. Here is an example of hash
# creation with duplicate keys:

say 'A:';
say my %friends = (Tom => 5, Bill => 6, Liz => 5, Tom => 7, Jack => 3);
# Bill => 6, Jack => 3, Liz => 5, Tom => 7

# Because two of our friends are named Tom, we lose the data associated with the first
# of them. This is something you should be careful about: hash keys are unique, so
# you’ll lose some items if the data associated with your keys has duplicates. The next
# section will show some ways of dealing with this possible problem.
#
# But this key uniqueness property also has very interesting upsides. For example, a
# typical way of removing duplicates from a list of items is to assign the list items to the
# keys of a hash (the value does not matter); at the end of the process, the list of keys
# has no duplicates:

say 'B:';
say my @array = < a b c d s a z a r e s d z r a >;
# [a b c d s a z a r e s d z r a]

say 'C:';
say my %unique = map { $_ => 1 }, @array;
# a => 1, b => 1, c => 1, d => 1, e => 1, r => 1, s => 1, z => 1

say 'D:';
say my @unique_array = keys %unique;
# [z a e s d c b r]

# As you can see, duplicates have been removed from the output array. In such a simple
# case, the unique built-in function would have been sufficient to remove duplicates
# from @array, but within a more complex program, it is quite common to use a hash
# (often called %seen) to check whether a value has already been seen.

