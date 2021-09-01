#!/usr/bin/env perl6
#
# Composition
#
# So far, we have looked at the elements of a program—variables, expressions, and
# statements—in isolation, without talking about how to combine them.
# One of the most useful features of programming languages is their ability to take
# small building blocks and compose them, i.e., to combine them in such a way that the
# result of one is the input of another one. For example, the argument of a function can
# be any kind of expression, including arithmetic operations:

my $degrees = 45; # 45
my $height = sin($degrees / 360.0 * 2 * pi); # 0.707106781186547
say "Degrees : $degrees";
say "Height : $height";

# Here, we have used parentheses for the argument to the sin function to clarify that all
# the arithmetic operations within the parentheses are completed before the sin func‐
# tion is actually called, so that it will use the result of these operations as its argument.
# You can also compose function calls:

my $x = 10; # 10
say "x = $x";
$x = exp log($x+1); # 11
say "x = $x";

# Almost anywhere you can put a value, you can put an arbitrary expression, with one
# exception: the left side of an assignment statement has to be a variable name, possibly
# along with its declaration. Almost any other expression on the left side is a syntax
# error (we will see rare exceptions to this rule later):

my $hours = 1; # 1
my $minutes = 0; # 0
$minutes = $hours * 60; # right # 60
say "Hours : $hours";
say "Minutes : $minutes";
# > $hours * 60 = $minutes; # wrong !!  # Cannot modify an immutable Int # in block <unit> at <unknown file> line 1

