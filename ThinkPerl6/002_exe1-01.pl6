#!/usr/bin/env perl6

# Think Perl6 chapter 1 exercises

say 'A:';
# If you are trying to print a string, what happens
# if you leave out one of the quotation marks, or both ?
say "Hello, World!";
say 'Hello, World!';

say 'B:';
# You can use a minus sign to make negative number like -2.
# What happens if you put a plus sign before a number ?
# What about 2++2 ?
say +2;
my $a = 2;
say ++$a;

say 'C:';
# In math notation, leading zeros are OK, as in 02.
# What happens if you try this in Perl ?
say 0o17;

say 'D:';
# What happens if you have two values with no operator between them,
# such as say 2 2; ?
say 2 - 2;

