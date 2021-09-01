#!/usr/bin/env perl6
#
# CHAPTER 4
#
# Loops, Conditionals, and Recursion
#
# The main topic of this chapter is the if statement, which executes different code
# depending on the state of the program. But first I want to introduce two new opera‐
# tors: integer division and modulo.
#
# Integer Division and Modulo
#
# The integer division operator, div, divides two numbers and rounds down to an inte‐
# ger. For example, suppose the runtime of a movie is 105 minutes. You might want to
# know how long that is in hours. In Perl, conventional division returns a rational
# number (in many languages, it returns a floating-point number, which is another
# kind of internal representation for noninteger numbers):

my $minutes = 105;
say $minutes / 60; # 1.75

# But we don’t normally write hours with decimal points. Integer division returns the
# integer number of hours, dropping the fraction part:

my $hours = $minutes div 60; # 1
say $hours;

# In arithmetic, integer division is sometimes called Euclidean division, which com‐
# putes a quotient and a remainder.
# To get the remainder, you could subtract off one hour in minutes:

my $remainder = $minutes - $hours * 60; # 45
say $remainder;

# An alternative is to use the modulo operator, %, which divides two numbers and
# returns the remainder:

say $remainder = $minutes % 60; # 45

# The modulo operator is very common in programming languages and is more useful
# than it seems. For example, you can check whether one number is divisible by
# another—if $dividend % $divisor is zero, then $dividend is divisible by $divisor .
# This is commonly used, for example, with a divisor equal to 2 in order to determine
# whether an integer is even or odd. We will see an example of that later in this chapter
# (see “Alternative Execution” on page 61).
# To tell the truth, Perl 6 also has a specific operator for divisibility, %%. The $dividend
# %% $divisor expression returns a true value if $dividend % $divisor is equal to 0,
# that is if $dividend is divisible by $divisor (and false otherwise).
# Also, you can extract the rightmost digit or digits from a number with the modulo
# operator. For example, $x % 10 yields the rightmost digit of $x (in base 10). Similarly,
# $x % 100 yields the last two digits:

say 642 % 100; # 42

