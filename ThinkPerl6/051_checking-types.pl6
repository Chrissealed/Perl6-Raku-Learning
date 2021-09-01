#!/usr/bin/env perl6
#
# Checking Types
#
# What happens if we call factorial and give it 1.5 as an argument?
#
# It seems that we get an infinite recursion. How can that be? The subroutine has a base
# case—when $n == 0. But if $n is not an integer, we can miss the base case and recurse
# forever.
# In the first recursive call, the value of $n is 0.5. In the next, it is –0.5. From there, it
# gets smaller (more negative), but it will never be 0.
# We have two choices. We can try to generalize the factorial function to work with
# noninteger numbers, or we can make factorial check its argument. The first option
# is called the gamma function, and it’s a little beyond the scope of this book. So we’ll go
# for the second.
# We have already seen examples of subroutines using the signature to verify the type of
# the argument. So we can add the Int type to the parameter in the signature. While
# we’re at it, we can also make sure the argument is positive or zero.

sub factorial(Int $n where $n >= 0){
    return 1 if $n == 0;
    return $n * factorial $n-1;
}

say factorial 8;

# The Int type checking in the signature handles nonintegers; this is not new. The
# where $n >= 0 part is a parameter constraint: if the parameter is negative, the sub‐
# routine should fail. Technically, the constraint is implemented here within the signa‐
# ture using a syntax feature called a trait, a property imposed on the parameter at
# compile time. If the argument passed to the function is not an integer or if it is nega‐
# tive, the program prints an error message to indicate that something went wrong:
#
# > say factorial 1.5
# Type check failed in binding $n; expected Int but got Rat
# in sub factorial at <unknown file> line 1
# in block <unit> at <unknown file> line 1
# > say factorial -3
# Constraint type check failed for parameter '$n'
# > say factorial "Fred"
# Type check failed in binding $n; expected Int but got Str
# in sub factorial at <unknown file> line 1
# in block <unit> at <unknown file> line 1
# If we get past both checks, we know that $n is an integer and that it is positive or zero,
# so we can prove that the recursion terminates.
#
# Another way to achieve a similar result is to define your own subset of the built-in
# types. For example, you can create an Even-int subset of integers and then use it
# more or less as if it were a new type for declaring your variables or typing your sub‐
# routine parameters:

subset Even-int of Int where { $_ %% 2 } # or : ... where { $_ % 2 == 0 }
# Even-int can now be used as a type

my Even-int $x = 2; # OK
say factorial $x;

# my Even-int $y = 3; # Type mismatch error
# Similarly, in the case of the factorial subroutine, we can create a nonnegative integer
# subset and use it for checking the parameter passed to the subroutine:

subset Non-neg-int of Int where { $_ >= 0}
# ...
sub factorial2(Non-neg-int $n){
    return 1 if $n == 0;
    return $n * factorial $n-1;
}

say factorial2 5

# If we pass a negative integer to the subroutine, we get a similar error as before:
# Constraint type check failed for parameter '$n'...
# This program demonstrates a pattern sometimes called a guardian. The signature acts
# as a guardian, protecting the code that follows from values that might cause an error.
# The guardians make it possible to prove the correctness of the code.

