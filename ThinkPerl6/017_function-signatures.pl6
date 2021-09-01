#!/usr/bin/env perl6
#
# Function Signatures
#
# When a function receives arguments, which are stored into parameters, the part of
# the function definition describing the parameters between parentheses is called the
# function signature. The function signatures we have seen so far are very simple and
# consist only of one parameter or possibly a parameter list.
# Signatures can provide a lot more information about the parameters used by a func‐
# tion. First, you may define the type of the parameters. Some functions make sense
# only if their parameters are numeric and should probably raise an error if they get a
# string that cannot be converted to a numeric value. For example, if you define a func‐
# tion half that computes a value equal to its argument divided by 2, it does not make
# sense to try to compute half of a string that is not numeric. It could be written as
# follows:

sub half(Int $number) {
    return $number / 2
}
say half 84; # -> 42

# If this function is called with a string, we get the following error:
# > say half "Douglas Adams"
# ===SORRY!=== Error while compiling <unknown file>
# Calling half(Str) will never work with declared signature (Int $number)
# at <unknown file>:1
# ------> say <HERE>half "Douglas Adams"
# The Int type included in the function signature is a type constraint that can help pre‐
# vent subtle bugs. In some cases, it can also be an annoyance. Consider this code
# snippet:
#
# sub half(Int $number) { $number / 2 }
# say half "84"; # -> ERROR
#
# Because the argument to the half subroutine is "84" , i.e., a string, this code will fail
# with a type error. If we had not included the Int type in the signature, the script
# would have converted (or coerced) the "84" string to a number, divided it by two, and
# printed out the expected result:
#
# sub half( $number) { $number / 2 }
# say half "84"; # -> 42
#
# In some cases, you want this conversion to occur, in others you don’t. It is up to you
# to decide whether you want strict typing or not, depending on the specific situation
# and needs. It is probably helpful to use parameter typing in many cases, but it can
# also become a straitjacket in some situations. Perl 6 lets you decide how strict you
# want to be about these things.
# Our original half subroutine has another limitation: it can work only on integers.
# But a function halving its argument should presumably be useful for rational or even
# other numbers. You can use the Real or Numeric types to make the function more
# general (the difference between the two types is that the Numeric type will accept not
# only Real but also Complex numbers). As it turns out that this half function will also
# work correctly with complex numbers, 1 choosing a Numeric type opens more possi‐
# bilities:

sub other-half(Numeric $number) { $number / 2 }
say other-half(3+4i); # -> 1.5+2i

# The following table sums up and illustrates some of the various types we have seen so
# far:
# Type    Example
# String "A string" , 'Another string' , "42"
# Integer -3, -2, 0, 2,42
# Rational 1/2, 0.5, 3,14159, 22/7, 42.0
# Real π, pi, √2, e, log 42, sin 0.7
# Complex 5.4 + 3i

