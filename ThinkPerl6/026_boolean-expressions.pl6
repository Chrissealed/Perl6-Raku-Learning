#!/usr/bin/env perl6
#
# Boolean expressions
#
# A Boolean expression is an expression that is either true or false. The following exam‐
# ples use the operator ==, which compares two numeric operands and produces True if
# they are equal and False otherwise:

say 'A:';
say 5 == 5; # True
say 5 == 6; # False

# True and False are special values that belong to the type Bool; they are not strings:

say True.WHAT; # (Bool)
say False.WHAT; # (Bool)

# The == operator is one of the numeric relational operators and checks whether the
# operands are equal; the others are:
#
# x != $y # $x is not numerically equal to $y
# x > $y # $x is numerically greater than $y
# x < $y # $x is numerically less than $y
# x >= $y # x is numerically greater than or equal to $y
# $x <= $y # is $x is numerically less than or equal to $y
# $x === $y # is $x and $y are truly identical
#
# Although these operations are probably familiar to you, the Perl symbols are different
# from the mathematical symbols. A common error is to use a single equals sign (=)
# instead of a double equals sign (==). Remember that = is an assignment operator and
# == is a relational operator. There is no such thing as <, and there exists a => operator,
# but it is not a relational operator, but something completely different (it is, as we’ll see
# later, a pair constructor).
#
# The difference between == and === is that the former operator checks whether the
# values of the operands are equal and the latter checks whether the operands are truly
# identical. As an example, consider this:

say 'B:';
say 42 == 42; # True
say 42 == 42.0; # True
say 42 === 42; # True
say 42 === 42.0; # False

# These relational operators can only compare numeric values (numbers or variables
# containing numbers) or values that can be coerced to numeric values, such as, for
# example, the string “42” which, if used with these operators (except ===), will be
# coerced to the number 42.
#
# For comparing strings (in a lexicographic or “pseudo-alphabetic” type of compari‐
# son), you need to use the string relational operators:
#
# $x eq $y # $x is string-wise equal to $y
# $x ne $y # $x is string-wise not equal to $y
# $x gt $y # $x is greater than $y (alphabetically after)
# $x lt $y # $x is less than $y (alphabetically before)
# $x ge $y # $x is greater than or equal to $y
# $x le $y # $x is less than or equal to $y
# $x eqv $y # $x is truly equivalent to $y
#
# For example, you may compare (alphabetically) two former US presidents:

say 'C:';
say 'FDR' eq 'JFK'; # False
say 'FDR' lt 'JFK'; # True # alphabetical comparison

# Unlike most other programming languages, Perl 6 allows you to chain relational
# operators transitively, just as in mathematical notation:

say 'D:';
say 4 < 7 < 12; # True
say 4 < 7 < 5; # False

# It may be useful to point out that numeric relational operators and string relational
# operators don’t work the same way (and that’s a good reason for having different
# operators), because they don’t have the same idea of what is greater than or less than.
#
# When comparing two positive integers, a number with four digits is always greater
# than a number with only two or three digits. For example, 1110 is greater than 886.
# String comparisons, in contrast, basically follow (pseudo) alphabetical rules: “b” is
# greater than “aaa” because the commonly accepted rule for string comparisons is to
# start by comparing the first letter of each string: which string is greater is known if
# the two letters are different, irrespective of what character comes next; you need to
# proceed to comparing the second letter of each word only if comparing the first letter
# of each string led to a draw, and so on. Thus, any word starting with “a” is less than
# any word starting with “b,” irrespective of the length of these words. You may think
# that this is nitpicking, but this becomes essential when you start sorting items: you
# really have to think about which type of order (numeric or alphabetical) you want to
# use.
# There are also some so-called “three-way” relational operators, cmp, <=>, and leg, but
# we’ll come back to them when we study how to sort the items in a list. Similarly, we
# need to learn quite a few other things about Perl before we can do justice to the
# incredibly powerful and expressive smart match operator, ~~.
# A final point to be noted about string comparisons is that uppercase letters are always
# deemed smaller than lowercase letters. So “A,” “B,” “BB,” and “C” are all less than “a,”
# “b,” “bb,” and “c.” We will not go into the details here, but this becomes more compli‐
# cated (and sometimes confusing) when the strings to be compared contain nonalpha‐
# betical characters (or non-ASCII Unicode letters).

