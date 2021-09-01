#!/usr/bin/env perl6
#
# Values and Types
#
# A value is one of the basic things a program works with, like a letter or a number.
# Some values we have seen so far are 2, 42, and "Hello, World" .
# These values belong to different types: 2 is an integer, 40 + 2 is also an integer, 84/2 is
# a rational number, and "Hello, World" is a string, so called because the characters it
# contains are strung together.
#
# If you are not sure what type a value has, Perl can tell you:

say 'A:';
say 42.WHAT;
say (40 + 2).WHAT;
say (84 / 2).WHAT;
say (42.0).WHAT;
say ("Hello, World").WHAT;

# In these instructions, .WHAT is known as an introspection method; that is, a kind of
# method which will tell you what (of which type) the preceding expression is. 42.WHAT
# is an example of the dot syntax used for method invocation: it calls the .WHAT built-in
# on the “42” expression (the invocant) and provides to the say function the result of
# this invocation, which in this case is the type of the expression.
# Not surprisingly, integers belong to the type Int, strings belong to Str, and rational
# numbers belong to Rat.
# Although 40 + 2 and 84 / 2 seem to yield the same result (42), the first expression
# returns an integer (Int) and the second a rational number (Rat). The number 42.0 is
# also a rational.
# The rational type is somewhat uncommon in most programming languages. Inter‐
# nally, these numbers are stored as two integers representing the numerator and the
# denominator (in their simplest terms). For example, the number 17.3 might be stored
# as two integers, 173 and 10, meaning that Perl is really storing something meaning
# the 173/10 fraction. Although this is usually not needed (except for introspection or
# debugging), you might access these two integers with the following methods:

say 'B:';
say my $num = 17.3;
say $num.WHAT;
say $num.numerator, " ", $num.denominator; # say can print a list
say $num.nude; # "nude" stands for numerator-denominator

# This may seem anecdotal, but, for reasons which are beyond the scope of this book,
# this makes it possible for Perl 6 to perform arithmetical operations on rational num‐
# bers with a much higher accuracy than most common programming languages. For
# example, if you try to perform the arithmetical operation 0.3 - 0.2 - 0.1 with
# most general purpose programming languages (and depending on your machine
# architecture), you might obtain a result such as –2.77555756156289e-17 (in Perl 5),
# –2.775558e-17 (in C under GCC), or –2.7755575615628914e-17 (Java, Python 3,
# Ruby, TCL). Don’t worry about these values if you don’t understand them; let us just
# say that they are extremely small but they are not 0, whereas, obviously, the result
# should really be zero. In Perl 6, the result is 0 (even to the fiftieth decimal digit):

say 'C:';
my $result-should-be-zero = 0.3 - 0.2 - 0.1; # prints 0
printf "%.50f\n", $result-should-be-zero; # prints 50 decimal digits 0.00000000000000000000000000000000000000000000000000

# In Perl 6, you might even compare the result of the operation with 0:

say $result-should-be-zero == 0; # True

# Don’t do such a comparison with most common programming languages; you’re very
# likely to get a wrong result.
# What about values like "2" and "42.0" ? They look like numbers, but they are in quo‐
# tation marks like strings.

say 'D:';
say '2'.perl; # perl returns a Perlish representation of the invocant # "2"
say "2".WHAT; # (Str)
say '42'.WHAT; # (Str)

# They’re strings because they are defined within quotes. Although Perl will often per‐
# form the necessary conversions for you, it is generally a good practice not to use quo‐
# tation marks if your value is intended to be a number.
# When you type a large integer, you might be tempted to use commas between groups
# of digits, as in 1,234,567. This is not a legal integer in Perl 6, but it is a legal expres‐
# sion:

say 'E:';
say 1,234,567; # (1 234 567)

# That’s actually a list of three different integer numbers, and not what we expected at
# all!

say (1,234,567).WHAT; # (List)

# Perl 6 interprets 1,234,567 as a comma-separated sequence of three integers. As we
# will see later, the comma is a separator used for constructing lists.
# You can, however, separate groups of digits with the underscore character (“_”) for
# better legibility and obtain a proper integer:

say 1_234_567; # 1234567
say 1_234_567.WHAT; # (Int)

