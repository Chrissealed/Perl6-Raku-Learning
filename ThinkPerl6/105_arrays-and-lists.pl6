#!/usr/bin/env perl6
#
# CHAPTER 9
#
# Arrays and Lists
#
# This chapter presents some of Perl’s most useful built-in types, arrays and lists.
#
# Lists and Arrays Are Sequences
#
# Like strings, lists and arrays are sequences of values. In a string, the values are charac‐
# ters; in a list or in an array, they can be any type. The values in a list or in an array are
# called elements or sometimes items.
#
# There are several important differences between lists and arrays. The main ones are
# that lists are ordered and immutable collections of items: you can’t change the num‐
# ber of items in a list and you can’t change the individual items either. Arrays, by con‐
# trast, are variables and are generally mutable: you can add elements to an array, or
# remove elements from it. And you can access the individual elements of an array and
# modify them. For this to be possible, arrays usually have a name (as do other vari‐
# ables), although some arrays are anonymous, which means that they have no name,
# but have some other ways of accessing them.
#
# A list is also ephemeral (unless it is assigned to a variable or some other thing): it
# ceases to exist as soon as it has been used, usually as soon as the program control flow
# goes to the next code line. An array, on the other hand, has some form of persistence:
# you may be able to use it somewhere else in the program if the variable containing it
# is still within scope.
#
# There are several ways to create a new list; the simplest is to enumerate its values, sep‐
# arated by commas:

say 'A:';
say 3, 4, 5;
# (3 4 5)
say (3, 4, 5).WHAT;
# (List)

say $_ for 1, 2, 3;
# 1
# 2
# 3

# You don’t need parentheses to create a list, but they are often useful to delimit it, i.e.,
# to stipulate where it starts and where it ends, and, in some cases, to override prece‐
# dence.
#
# We used lists earlier in this book. If we write:

say 'B:';
print "$_ " for 1, 3, 5, 9, "\n";
# 1 3 5 9
print "$_ " for 1..10;
# 1 2 3 4 5 6 7 8 9 10 >
print "\n";

# we are basically creating and using a list of integers (from the standpoint of the type
# hierarchy of Perl; this observation is not entirely accurate technically for the second
# example, since 1..10 has a Range type, and it gets transformed into a Seq type, but
# this approximation is good enough for our purposes here).
#
# Arrays are variables whose names start with the sigil @. Named arrays need to be
# declared before they are used, just as any other variable we’ve seen so far (except the
# topical variable, $_). One of the easiest ways to create an array is to assign a list to it:

say 'C:';
my @odd_digits = 1, 3, 5, 7, 9;
say @odd_digits;
# [1 3 5 7 9]
say @odd_digits.WHAT;
# (Array)
my @single_digit_numbers = 0..9;
say @single_digit_numbers;
# [0 1 2 3 4 5 6 7 8 9]
#
# Under the Perl REPL, an array is displayed between square brackets ([ and ]), while
# lists are displayed between round parentheses.
#
# If the items don’t contain any space characters, it is quite handy to construct a list
# (and assign it to an array if needed) using the <...> quote-word operator:

say 'D:';
my @weekdays = <mon tue wed thu fri>;
say @weekdays;
# [mon tue wed thu fri]
my @weekend = <sat sun>;
say @weekend;
# [sat sun]

# The advantage of this construction is that there is no need to separate the items with
# commas and no need to insert them between quotes when the items are strings. Basi‐
# cally, the quote-word operator breaks up its content on whitespace and returns a list
# of words, which can then be used in a loop or assigned to an array as in the example
# above.
#
# Most of the rest of this chapter will be devoted to arrays rather than lists, but keep in
# mind that many of the array functions and operators we will study here also work on
# lists (at least most of those that would not violate the immutability property of lists).
#
# The items of an array (or a list) don’t need to be of the same type:

say 'E:';
my @heterogeneous-array = 1, 2.3, pi, "str", (1, 2, 4);
say @heterogeneous-array;
# [1 2.3 3.14159265358979 str (1 2 4)]

# Here, the array is composed of an integer, a rational, a float (Num type), a string, and a
# list of three integers. It may not be advisable for the sake of the developer’s mental
# sanity to use an array with such wildly heterogeneous items, but Perl will not com‐
# plain about that: it is up to you to make sense of your data.
#
# The previous array even contains a list of items. If you iterate over the elements of
# this array for example with a for loop statement, this list will arrive as one distinct
# element; it will not get “flattened” as three elements of the array. Similarly, elems is a
# method to count the number of items of an array (or of a list). Using it on the above
# array produces the following result:

say 'F:';
say @heterogeneous-array.elems;
# 5

# As you can see, the (1, 2, 4) list “counts” as one single array element.
#
# A list within another list is nested.
#
# An array that contains no elements is called an empty array; you can create one with
# empty parentheses, () :

say 'G:';
my @empty = ();
say @empty;
# []

# This code is really assigning an empty list to the array. But this syntax is usually not
# needed when creating a new empty array, since just declaring an array without defin‐
# ing it has the same effect:

my @empty2;
say @empty2;
# []

# So using the empty parentheses (i.e., assigning an empty list) would be needed essen‐
# tially for resetting an existing array to an empty array.

