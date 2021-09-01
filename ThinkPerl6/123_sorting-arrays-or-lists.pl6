#!/usr/bin/env perl6
#
# Sorting Arrays or Lists
#
# Sorting data is a very common operation in computer science. Perl has a sort func‐
# tion that can sort an array or a list and return the sorted result:

say 'A:';
say sort <4 6 2 9 1 5 11>; # -> (1 2 4 5 6 9 11)

# There are several types of sorts. The most common are numeric sort and lexico‐
# graphic (or alphabetic) sort. They differ in the way they compare individual items to
# be sorted.
#
# In alphabetic sort, you first compare the first letter of the words to be compared; a
# word starting with an “a” will always come before a word starting with a “b” (or any
# other letter) in an ascending sort, irrespective of the value or number of the other
# characters. You need to compare the second character of two words only if the first
# character of these words is the same.
#
# Numeric sorting is very different: it is the overall value of the number that is of inter‐
# est. For example, if we are sorting integers, 11 is larger than 9 because it has more
# digits. But alphabetic sorting of 9 and 11 would consider 11 to be smaller than 9,
# because the first digit is smaller.
# So an alphabetic or lexicographic sort of the list of integers above would return:
# (1 11 2 4 5 6 9)
#
# The consequence is that, with many programming languages, when you want to sort
# data, you need to specify which type of sort you want. With consistent data (every
# item of the same type), Perl 6 is usually clever enough to find out which type of sort is
# best suited to your needs. So, for example, this code will perform the type of sort that
# you probably expect:

say 'B:';
say sort <ac a bc ab abc cb ca>; # ->(a ab abc ac bc ca cb)

# As you can see, Perl correctly sorts both numeric and string types. Even with mixed
# data types, sort can do a pretty good job at providing a result that may very well be
# what you are looking for:

say 'C:';
say sort <1 b 11 5 cb 4 12 a ab abc 42 ac bc ca >;
# -> (1 4 5 11 12 42 a ab abc ac b bc ca cb)

# There are cases, however, where this simple use of the sort function will fail to return
# what you probably want:

say 'D:';
say sort <a ab abc A bc BAC AC>; # -> (A AC BAC a ab abc bc)

# Here, sort puts all strings starting with an uppercase letter before any string starting
# with a lowercase letter, probably not what you want. It looks even worse if the strings
# use extended ASCII characters:

say 'E:';
say sort <a ab àb abc Ñ A bc BAC AC>; # -> (A AC BAC a ab abc bc Ñ àb)

# The reason is that, when sorting strings, sort uses the internal numeric encoding of
# letters. This was sometimes called “ASCIIbetical” order (by contrast with alphabetical
# order), but the term is now too limited and somewhat obsolete, because Perl 6 is
# using Unicode rather than ASCII.
#
# Clearly, these are cases where more advanced sorting techniques are needed.

