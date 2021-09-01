#!/usr/bin/env perl6
#
# Logical Operators
#
# There are three main pairs of logical operators:
#
# • logical and: “and” and &&
# • logical or: “or” and ||
# • logical not: “not” and !
#
# The semantics (meaning) of these operators is similar to their meaning in English.
# For example, $x > 0 and $x < 10 is true only if $x is greater than 0 and less than 10.
# $n % 2 == 0 and $n % 3 == 0 is true if both conditions are true, that is, if the num‐
# ber is divisible by 2 and by 3, i.e., is in fact divisible by 6 (which could be better writ‐
# ten as: $n % 6 == 0 or $n %% 6).
# $n % 2 == 0 or $n % 3 == 0 is true if either or both of the conditions is true, that is,
# if the number is divisible by 2 or by 3 (or both).
# Finally, the not operator negates a Boolean expression, so not (x > y) is true if x >
# y is false, that is, if x is less than or equal to y .
#
# The && , ||, and ! operators have the same meanings, respectively, as and, or, and not,
# but they have a tighter precedence, which means that when they stand in an expres‐
# sion with some other operators, they have a higher priority of execution. We will
# come back to precedence later, but let’s say for the time being that, in most common
# cases, the and, or, and not operators will usually do what you want.
# Strictly speaking, the operands of the logical operators should be Boolean expres‐
# sions, but Perl, just like many languages partly derived from C, is not very strict on
# that. The numbers 0 and 0.0 are false; and any nonzero number or nonempty string is
# interpreted as True :

say 42 and True; # True

# This flexibility can be very useful, but there are some subtleties to it that might be
# confusing. You might want to avoid it unless you know what you are doing.
# The so built-in function returns a Boolean evaluation of its argument:

say so (0 and True); # False

# Here, the expression (0 and True) is false because 0 is false and the expression could
# be true only if both arguments of the and operator were true.
# When several Boolean conditions are linked with some logical operator, Perl will only
# perform the comparisons that are strictly necessary to figure out the final result, start‐
# ing with those on the left. For example, if you write:

my $number = 0;
say False and $number > 0; # False

# there is no need to evaluate the second Boolean expression to know that the overall
# expression will be false. In this case, Perl does not try to check whether the number is
# positive or even whether it is defined. It is sometimes said that these operators “short
# circuit” unnecessary conditions.
#
# Similarly, in the following code, the compute-pension subroutine will not even be
# called if the person’s age is less than 65:
#
# $age >= 65 and compute-pension();
#
# The same goes with the or operator, but the other way around: if the first Boolean
# expression of an or statement is true, then the next expression will not be evaluated.
# The following code is thus equivalent to the previous one:
#
# $age < 65 or compute-pension();
#
# This can be a way of running the compute-pension subroutine conditionally, depend‐
# ing on the value of the age, and this is sometimes used, notably in idiomatic con‐
# structs such as:
#
# do-something() or die "could not do something";
#
# which aborts the program if do-something returns a false value, meaning that it was
# not able to do something so essential that it would not make sense to try to continue
# running it.
# We will examine now clearer and much more common ways of running conditional
# code.

