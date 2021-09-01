#!/usr/bin/env perl6
#
# More Recursion
#
# To give you an idea of what you can do with the tools you have learned so far, we’ll
# evaluate a few recursively defined mathematical functions. A recursive definition is
# similar to a circular definition, in the sense that the definition contains a reference to
# the thing being defined. A truly circular definition is not very useful:
# vorpal
# An adjective used to describe something that is vorpal.
# If you saw that definition in the dictionary, you might be annoyed. On the other
# hand, if you looked up the definition of the factorial function, denoted with the sym‐
# bol !, you might get something like this:
# 0! = 1
# n! = n(n − 1)!
# This definition says that the factorial of 0 is 1, and the factorial of any other (positive
# integer) value, n, is n multiplied by the factorial of n − 1.
# So 3! is 3 times 2!, which is 2 times 1!, which is 1 times 0!. Putting it all together, 3!
# equals 3 times 2 times 1 times 1, which is 6.
# If you can write a recursive definition of something, you can write a Perl program to
# evaluate it. The first step is to decide what the parameters should be. In this case it
# should be clear that factorial takes a number: 1
#
# sub factorial($n){
# }
#
# If the argument happens to be 0, all we have to do is return (1):
# (1) It should really be an integer, but we’ll get back to that later in this chapter.
#
# sub factorial($n){
#     if $n == 0 {
#         return 1;
#     }
# }
#
# Otherwise, and this is the interesting part, we have to make a recursive call to find the
# factorial of n − 1 and then multiply it by n:

sub factorial($n){
    if $n == 0 {
        return 1;
    } else {
        my $recurse = factorial($n-1);
        my $result = $n * $recurse;
        return $result;
    }
}

say factorial 6;

# The flow of execution for this program is similar to the flow of countdown in “Recur‐
# sion” on page 66. If we call factorial with the value 3:
# Since 3 is not 0, we take the second branch and calculate the factorial of $n-1 ...
# Since 2 is not 0, we take the second branch and calculate the factorial of $n-1 ...
# Since 1 is not 0, we take the second branch and calculate the factorial of
# $n-1 ...
# Since 0 equals 0, we take the first branch and return 1 without mak‐
# ing any more recursive calls.
# The return value, 1, is multiplied by $n , which is 1, and the result is returned.
# The return value, 1, is multiplied by $n , which is 2, and the result is returned.
# The return value, 2, is multiplied by $n , which is 3, and the result, 6, becomes the
# return value of the subroutine call that started the whole process.
#
# Figure 5-1 shows what the stack diagram looks like for this sequence of function calls.
#
# The return values are shown being passed back up the stack. In each frame, the
# return value is the value of result , which is the product of n and recurse .
# In the last frame, the local variables recurse and result do not exist, because the
# branch that creates them does not run.
#
# Figure 5-1. Stack diagram
#
# A seasoned Perl programmer might write a more concise or more idiomatic subrou‐
# tine: (2)
# (2) We will see later even more idiomatic ways of computing the factorial of a number.

sub factorial2($n){
    return 1 if $n == 0;
    return $n * factorial $n-1;
}

say factorial2 6;

# This is not better than our initial version, and will probably not run significantly
# faster, but this is arguably clearer, at least once you get used to this type of syntax.

