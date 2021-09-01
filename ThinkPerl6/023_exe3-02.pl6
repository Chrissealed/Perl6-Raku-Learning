#!/usr/bin/env perl6
#
# Exercise 3-2.
# We have seen that functions and other code objects can be passed around as values,
# just like any object. Functions are said to be first-class objects. For example, do-twice
# is a function that takes a function as an argument and calls it twice:
# sub do-twice($code) {
#     $code();
#     $code();
# }
# sub greet {
#     say "Hello World!";
# }
# do-twice(&greet);
# 1. Type this example into a script and test it.
# 2. Modify do-twice so that it takes two arguments, a function and a value, and calls
# the function twice, passing the value as an argument.
# 3. Copy the definition of print-twice from earlier in this chapter to your script.
# 4. Use the modified version of do-twice to call print-twice twice, passing “What’s
# up doc” as an argument.
# 5. Define a new function called do-four that takes a function and a value and calls
# the function four times, passing the value as a parameter. There should be only
# two statements in the body of this function, not four.
# Solution: “Exercise 3-2: Subroutine do-twice” on page 347.

