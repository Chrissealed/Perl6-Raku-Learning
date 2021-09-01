#!/usr/bin/env perl6
#
# One More Example
#
# After factorial, the most common example of a recursively defined mathematical
# function is fibonacci, which has the following definition (see also the Wikipedia
# entry):
# fibonacci 0 = 1
# fibonacci 1 = 1
# fibonacci n = fibonacci n − 1 + fibonacci n − 2
#
# In plain English, a Fibonacci sequence is a sequence of numbers such as:
# 1, 1, 2, 3, 5, 8, 13, 21, ...
# where the two first terms are equal to 1 and any other term is the sum of the two
# preceding ones.
# We briefly covered the Fibonacci sequence in Exercise 4-4 and implemented it with a
# for loop. Let’s now translate the recursive definition into Perl. It looks like this:

sub fibonacci ($n) {
    return 1 if $n == 0 or $n == 1;
    return fibonacci($n-1) + fibonacci($n-2);
}

say fibonacci 10;

# If you try to follow the flow of execution here, even for fairly small values of $n, your
# head explodes. But according to the leap of faith, if you assume that the two recursive
# calls work correctly, then it is clear that you get the right result by adding them
# together.

