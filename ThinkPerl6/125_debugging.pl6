#!/usr/bin/env perl6
#
# Debugging
#
# Careless use of arrays (and other mutable objects) can lead to long hours of debug‐
# ging. Here are some common pitfalls and ways to avoid them:
#
# 1. Some array built-in functions and methods modify their argument(s) and others
# don’t.
# It may be tempting to write code like this:
#
# @array = splice @array, 1, 2, $new_item; # WRONG!
#
# The splice function returns the elements it has deleted from the array, not the
# array itself, which is modified “in place.”
#
# Before using array methods and operators, you should read the documentation
# carefully and perhaps test them in interactive mode.
#
# When traversing an array, for example with for or map, the $_ topical variable is
# an alias for the successive items of the array, and not a copy of them. This means
# that if you change $_, the change will be reflected in the array. There may be
# some cases where this is what you want, and others where you don’t care (if you
# no longer need the original array), but this technique is error-prone and should
# perhaps be avoided (or at least used only with great care).
#
my @numbers = <1 2 3>;
# push @doubles, $_*=2 for @numbers; # WRONG (probably)
# say @numbers; # -> [2 4 6]
#
# The error here is that the $_*=2 statement is modifying $_, so that the @numbers
# array is also modified, whereas the intent was certainly to populate the new num‐
# bers into @doubles, not to modify @numbers.
#
# The same code applied to a literal list instead of an array leads to a runtime error
# because a list is immutable:
#
# > push @doubles, $_*=2 for <1 2 3>; # WRONG (definitely)
# Cannot assign to an immutable value
#
# The fix is quite easy in this case and consists of using an expression that does not
# modify $_ but returns the new desired value:

push my @doubles, $_ * 2 for @numbers; # OK
say @doubles;

# The same goes for map :

# my @numbers = <1 2 3>;
# say map { ++$_}, @numbers; # WRONG (probably)
# say @numbers; # -> [2 3 4]
#
# Here again, using an expression that does not modify $_ but instead returns the
# new desired value will fix the problem:

@numbers = <1 2 3>;
say map { $_ + 1}, @numbers; # -> (2 3 4)
say @numbers; # -> [1 2 3]

