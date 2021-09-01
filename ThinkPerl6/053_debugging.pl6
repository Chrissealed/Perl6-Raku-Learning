#!/usr/bin/env perl6
#
# Debugging
#
# Breaking a large program into smaller functions or subroutines creates natural check‐
# points for debugging. If a subroutine is not working, there are three possibilities to
# consider:
#
# • There is something wrong with the arguments the subroutine is getting; a pre‐
# condition is violated.
#
# • There is something wrong with the subroutine; a postcondition is violated.
#
# • There is something wrong with the return value or the way it is being used.
#
# To rule out the first possibility, you can add a print statement at the beginning of the
# function and display the values of the parameters (and maybe their types). Or you
# can write code that checks the preconditions explicitly.
# For the purpose of debugging, it is often useful to print the content of a variable or of
# a parameter within a string with surrounding characters, so that you may visualize
# characters that are otherwise invisible, such as spaces or newlines. For example, you
# think that the $var should contain “two,” and run the following test:
#
# if $var eq "two" {
#     do-something()
# }
#
# But it fails and the do-something subroutine is never called.
# Perhaps you want to use a print statement that will ascertain the content of $var :
#
# say "[$var]";
# if $var eq "two" {
#     do-something()
# }
# This might print:
# [two ]
# or:
# [two
# ]
#
# Now, you know that the equality test fails because $var contains a trailing character
# (space or newline) that might otherwise be difficult to detect.
# If the parameters look good, add a print statement before each return statement and
# display the return value. If possible, check the result by hand. Consider calling the
# function with values that make it easy to check the result (as in “Incremental Devel‐
# opment” on page 79).
# If the function seems to be working, look at the function call to make sure the return
# value is being used correctly (or used at all!).
# Adding print statements at the beginning and end of a function can help make the
# flow of execution more visible. For example, here is a version of factorial with print
# statements:

sub factorial(Int $n) {
    my $space = ' ' x (4 * $n);
    say $space, 'factorial ', $n;
    if $n == 0 {
        say $space, 'returning 1';
        return 1;
    } else {
        my $result = $n * factorial $n-1;
        say $space, 'returning ', $result;
        return $result;
    }
}

say factorial 4;

# The $space variable is a string of space characters that controls the indentation of the
# output. Here is the result of factorial(4) :
#         factorial 4
#       factorial 3
#     factorial 2
#   factorial 1
# factorial 0
# returning 1
#   returning 1
#     returning 2
#       returning 6
#         returning 24
#
# If you are confused about the flow of execution, this kind of output can be helpful. It
# takes some time to develop effective scaffolding, but a bit of scaffolding can save a lot
# of debugging.

