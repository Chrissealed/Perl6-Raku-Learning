#!/usr/bin/env perl6
#
# Functions and Methods
#
# A method is similar to a function—it takes arguments and returns a value—but the
# calling syntax is different. With a function, you specify the name of the function fol‐
# lowed by its arguments. A method, by contrast, uses the dot notation: you specify the
# name of the object on which the method is called, followed by a dot and the name of
# the method (and possibly additional arguments).
# A method call is often called an invocation. The deeper differences between functions
# and methods will become apparent much later, when studying object-oriented pro‐
# gramming (in Chapter 12).
# For the time being, we can consider that the difference is essentially a matter of a dif‐
# ferent calling syntax when using Perl’s built-ins. Most Perl built-ins accept both a
# function call syntax and a method invocation syntax. For example, the following
# statements are equivalent:

say 42; # 42 # function call syntax
42.say; # 42 # method invocation syntax

# You can also chain built-in routines with both syntactic forms:
#
42.WHAT.say; # (Int) # method syntax
say WHAT 42; # (Int) # function syntax
say 42.WHAT; # (Int) # mixed syntax

# It is up to you to decide whether you prefer one form or the other, but we will use
# both forms, if only to get you used to both of them.

