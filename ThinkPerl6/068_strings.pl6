#!/usr/bin/env perl6
#
# Strings are not like integers, rationals, and Booleans. A string is a sequence of charac‐
# ters, which means it is an ordered collection of other values, and you sometimes need
# to access to some of these individual values. In this chapter you’ll see how to analyze,
# handle, and modify strings, and you’ll learn about some of the methods strings pro‐
# vide. You will also start to learn about a very powerful tool for manipulating text data:
# regular expressions, a.k.a. regexes.
#
# A String Is a Sequence
#
# A string is primarily a piece of textual data, but it is technically an ordered sequence
# of characters.
# Many programming languages allow you to access individual characters of a string
# with an index between brackets. This is not directly possible in Perl, but you still can
# access the characters one at a time using the comb built-in method and the bracket
# operator:

my $string = "banana";
# banana
my $st = $string.comb;
# (b a n a n a)
say $st[1];
# a
say $st[2];
# n

# The comb in the second statement splits the string into a list of characters that you can
# then access individually with square brackets.
# The expression in brackets is called an index (it is sometimes also called a subscript).
# The index indicates which character in the sequence you want (hence the name). But
# this may not be what you expected: the item with index 1 is the second letter of the
# word. For computer scientists, the index is usually an offset from the beginning. The
# offset of the first letter (“b”) is zero, and the offset of the first “a” is 1, not 2, and so on.
# You could also retrieve a slice of several characters in one go using the range operator
# within the brackets:

say $st[2..5]
# (n a n a)

# Again, the “nana” substring starts on the third letter of 'banana' , but this letter is
# indexed 2, and the sixth letter is index 5.
# But, even if all this might be useful at times, this is not the way you would usually
# handle strings in Perl, which has higher level tools that are more powerful and more
# expressive, so that you seldom need to use indexes or subscripts to access individual
# characters.
# Also, if there is a real need to access and manipulate individual letters, it would make
# more sense to store them in an array, but we haven’t covered arrays yet, so we’ll have
# to come back to that later.

