#!/usr/bin/env perl6
#
# Memos
#
# If you played with the fibonacci subroutine from “One More Example” on page 87,
# you might have noticed that the bigger the argument you provide, the longer the sub‐
# routine takes to run. Furthermore, the runtime increases extremely quickly.
# To understand why, consider Figure 10-2, which shows the call graph for fibonacci
# with n=4.
#
# Figure 10-2. Call graph
#
# A call graph shows a set of subroutine frames, with lines connecting each frame to the
# frames of the functions it calls. At the top of the graph, fibonacci with $n=4 calls
# fibonacci with $n=3 and $n=2. In turn, fibonacci with $n=3 calls fibonacci with
# $n=2 and $n=1. And so on.
#
# Count how many times fibonacci(0) and fibonacci(1) are called. This is an ineffi‐
# cient solution to the problem, and it gets much worse as the argument gets bigger.
# One solution is to keep track of values that have already been computed by storing
# them in a hash. A previously computed value that is stored for later use is called a
# memo. Here is a “memoized” version of fibonacci :

say my %known = 0 => 1, 1 => 1;
say fibonacci(10);
sub fibonacci ($n) {
    return %known{$n} if %known{$n}:exists;
    %known{$n} = fibonacci($n-1) + fibonacci($n-2);
    return %known{$n};
}

# %known is a hash that keeps track of the Fibonacci numbers we already know. It starts
# with two items: 0 and 1, which both map to 1.
# Whenever fibonacci is called, it checks %known. If the result is already there, it can
# return immediately. Otherwise, it has to compute the new value, add it to the hash,
# and return it.
#
# If you run this version of fibonacci and compare it with the original, you will find
# that it is much faster, especially for a large argument (say more than 30).
# Memoizing is a form of caching, i.e., storing in memory the result of a (presumably
# costly) computing operation in order to avoid computing it again. This process is
# sometimes called “trading memory against CPU cycles.” In some cases, such as our
# Fibonacci recursive example here, the gain can be absolutely huge: calculating the
# 100th Fibonacci number would take billions of years with the original recursive sub‐
# routine and it takes only a split second with the memoized version.
#
# Please note that in the specific case of the Fibonacci function, we are storing values
# for each successive integer; we could have memoized the Fibonacci numbers in an
# array rather than in a hash (and it might even be slightly more efficient), but using a
# hash for such purpose is a more general solution, working even when the memo keys
# are not consecutive integers.
#
# As an exercise, try to rewrite the fibonacci subroutine using an array instead of a
# hash to memoize the calculated Fibonacci numbers.

