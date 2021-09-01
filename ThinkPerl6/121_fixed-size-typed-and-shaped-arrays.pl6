#!/usr/bin/env perl6
#
# Fixed-Size, Typed, and Shaped Arrays
#
# By default, arrays can contain items of any type, including items of different types,
# and can auto-extend as you need. Perl will take care of the underlying gory details for
# you, so that you don’t have to worry about them. This is very practical but also comes
# with a cost: some array operations might be unexpectedly slow, because Perl may have
# to perform quite a bit of housecleaning behind the scenes, such as memory allocation
# or reallocation, copying a full array within memory, etc.
#
# In some cases, however, it is possible to know beforehand the size of an array and the
# data type of its items. If Perl knows about these, it might be able to work faster and
# use much less memory. It might also help you to prevent subtle bugs.
# To declare the type of the elements of an array, just specify it when declaring the
# array. For example, to declare an array of integers:

my Int @numbers = 1..20;
say @numbers;
# [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]
# @numbers[7] = 3.5; # ERROR

# Type check failed in assignment to @numbers; expected Int but got Rat
# in block <unit> at <unknown file> line 1
#
# Similarly, you can declare the size of an array. Such arrays are sometimes called sha‐
# ped arrays. There are 12 months in a year, so you might tell Perl that your @months
# array will never contain more than 12 items:

my @months[12] = 1..7;
# [1 2 3 4 5 6 7 (Any) (Any) (Any) (Any) (Any)]
say @months;
say @months.elems;
# 12
say @months[3];
# 4
# say @months[12];
# Index 12 for dimension 1 out of range (must be 0..11)
#
# Here, Perl has allocated 12 “slots” to the array, even though the last five are currently
# undefined. Perl may not need to reallocate memory when you define the 10th item of
# the array. And Perl tells you about your mistake if you accidentally try to access an
# out-of-range item.
#
# Defining both the type of the elements and the maximal size of the array may lead to
# a noticeable performance gain in terms of execution speed (at least for some opera‐
# tions) and reduce significantly the memory usage of the program, especially when
# handling large arrays.

