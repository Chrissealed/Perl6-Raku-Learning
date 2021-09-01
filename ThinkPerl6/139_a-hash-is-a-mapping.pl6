#!/usr/bin/env perl6
#
# A Hash Is a Mapping
#
# A hash is like an array, but more general. In an array, the indices or subscripts have to
# be integers; in a hash, they can be (almost) anything.
# A hash contains a collection of indices, which are called keys, and a collection of val‐
# ues. Each key is associated with a single value. A key and a value together form a pair
# (an object of the Pair type), or a key-value pair. A hash can be viewed as a collection
# of key-value pairs. The values in a hash can also be called items or elements, as with
# arrays.
# In other programming languages, hashes are sometimes called dictionaries, hash
# tables, maps, or associative arrays.
#
# In mathematical language, a hash represents a mapping from keys to values, so you
# can also say that each key “maps to” a value. As an example, we’ll build a hash that
# maps from English to Spanish words, so the keys and the values are all strings.
# In Perl, hash names start with the “%” sigil. To create a new hash, you just declare it
# this way:

say 'A:';
my %eng2sp;

# This creates an empty hash. To add items to the hash, you can use curly braces (a.k.a.
# curly brackets or sometimes simply “curlies”):

%eng2sp{'one'} = 'uno';

# This line creates an item that maps from the key 'one' to the value 'uno' .
# If the key is a string containing a single word (i.e., without any space in the middle of
# it), there is a more idiomatic shortcut to create the same hash entry:

%eng2sp<one> = 'uno';
say %eng2sp<one>; # uno

# If we print the hash, we see a key-value pair with a => pair constructor operator
# between the key and value:

say %eng2sp; # one => uno

# This output format is also an input format. For example, you can create a new hash
# with three items:

say 'B:';
%eng2sp = ('one' => 'uno', 'two' => 'dos', 'three' => 'tres');
say %eng2sp; # one => uno, three => tres, two => dos

# Using the => pair constructor operator between keys and values is not required; you
# may use a comma as well:

%eng2sp = ('one', 'uno', 'two', 'dos', 'three', 'tres');
say %eng2sp; # one => uno, three => tres, two => dos

# But the pair constructor has the advantage of showing more graphically the key-value
# relations. The pair constructor operator also makes the use of quotes nonmandatory
# on its lefthand side (if the key is a string with no space):

%eng2sp = (one => 'uno', two => 'dos', three => 'tres');
say %eng2sp; # one => uno, three => tres, two => dos

# You might also use a more concise list syntax for the hash assignment and Perl will
# happily convert the list into a hash, provided the number of items in the input list is
# even:

%eng2sp = <one uno two dos three tres>;
say %eng2sp; # one => uno, three => tres, two => dos

# You might be surprised by the output. The order of the key-value pairs is usually not
# the order in which you populated the hash. In general, the order of items in a hash is
# unpredictable.
# But that’s not a problem because the elements of a hash are never indexed with inte‐
# ger subscripts. Instead, you use the keys to look up the corresponding values:

say 'C:';
say %eng2sp<two>; # dos

# The key two always maps to the value 'dos' so the order of the items doesn’t matter.
#
# If the key isn’t in the hash, you get an undefined value:

say %eng2sp<four>; # (Any)

# The elems method or function works on hashes just as on arrays; it returns the num‐
# ber of key-value pairs:

say 'D:';
say %eng2sp.elems; # 3
say elems %eng2sp; # 3

# The :exists adverb also works on hashes as on arrays; it tells you whether something
# appears as a key in the hash (appearing as a value is not good enough): (1)

# 1) Evaluating the value in a Boolean context would also work with our example, but this would return some‐
# thing wrong when the key exists but the value is not defined or otherwise evaluates to a false value (for exam‐
# ple, if it is equal to False , zero, or an empty string).

say 'E:';
say %eng2sp<two> :exists; # True
say %eng2sp<four> :exists; # False

# To see whether something appears as a value in a hash, you can use the values
# method, which returns a collection of values, and then use a loop (or possibly a grep)
# to look for the searched item:

say 'F:';
my @vals = values %eng2sp;
for @vals -> $value {
    say "Found it!" if $value eq 'uno'; # -> Found it!
}

# Or more concisely:

say "Found it!" if grep {$_ eq 'uno'}, %eng2sp.values;

# Since grep defaults to a smart match, this can be made even more concise:

say "Found it!" if grep {'uno'}, %eng2sp.values; # -> Found it!

# When looking for values, the program has to search the elements of the list in order
# (or sequentially), as in “Searching for a Substring Within the String” on page 111. As
# the list gets longer, the search time gets longer in direct proportion.
# By contrast, when looking for keys, Perl uses a hashing algorithm that has a remarka‐
# ble property: it takes about the same amount of time no matter how many items are
# in the hash. In other words, it performs really fast, compared to the list size, when the
# searched list is large. Thi ic the reason why the solution to the reverse pair exercise
# (Exercise 9-11) of the previous chapter using a hash was almost three times faster
# than the bisection search solution (see “Exercise 9-11: Reverse Pairs” on page 396).

