#!/usr/bin/env perl6
#
# Reducing a List to a Value
#
# To add up all the numbers in a list, you can use a for loop like this:

say 'A:';
sub add_all (@numbers) {
    my $total = 0;
    for @numbers -> $x {
        $total += $x;
    }
    return $total;
}
say add_all(1..10);

# $total is initialized to 0. Each time through the loop, $x gets one element from the
# list and is added to $total. As the loop runs, total accumulates the sum of the ele‐
# ments; a variable used this way is sometimes called an accumulator.
#
# An operation like this that combines a sequence of elements into a single value is
# often called a reduction operation because its effect is to reduce all the items to one
# element (this is also sometimes called “folding” in some other programming
# languages). These ideas are derived from functional programming languages such as
# LISP (whose name stands for “list processing”).
#
# Perl 6 has a reduce function, which generates a single “combined” value from a list of
# values by iteratively applying to each item of a list a function that knows how to com‐
# bine two values. Using the reduce function to compute the sum of the first 10 num‐
# bers might look like this:

say 'B:';
my $sum = reduce { $^a + $^b }, 1..10;
say $sum;
# 55

# Remember the factorial function of “for Loops” on page 64? It used a for loop to
# compute the product of the n first integers up to a limit. It could be rewritten as fol‐
# lows using the reduce function:

say 'C:';
sub factorial (Int $num) {
    return reduce { $^a * $^b }, 1..$num;
}
say factorial 10; # -> 3628800

# In fact, the code to compute the factorial is so short with the reduce function that it
# may be argued that it has become unnecessary to write a subroutine for that. You
# could just “inline” the code:

say 'D:';
my $fact10 = reduce { $^a * $^b }, 1..10; # -> 3628800
say $fact10;

# We can do many more powerful things with that, but we’ll come back to that later, as
# it requires a few syntactic features that we haven’t seen yet.

