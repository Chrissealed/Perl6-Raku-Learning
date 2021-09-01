#!/usr/bin/env perl6
#
# Subroutine Named and Optional Parameters
#
# The subroutines that we have seen so far used positional parameters, i.e., parameters
# whose binding with the subroutine call arguments rely on their order within the list
# of arguments and in the signature. This is usually fine when the number of arguments
# passed to the subroutine is small (say, three or less).
# When the subroutine signature becomes longer, using positional arguments might
# become cumbersome and error-prone.
#
# Named Parameters
#
# Named arguments may be supplied in any order: the name of the parameter is bound
# to the argument having the same name. For example:

say 'A:';
sub divide (:$dividend, :$divisor where $divisor != 0) {
    return $dividend/$divisor;
}
say divide(dividend => 2048, divisor => 128); # -> 16 or:
say divide(divisor => 128, dividend => 2048); # -> 16

# The arguments are supplied at the subroutine call as a list of pairs using the pair-
# constructor syntax. In the signature, the parameters are retrieved with the so-called
# colon-pair syntax: the $dividend parameter is bound to the value of the pair whose
# key is “dividend” (2048), and $divisor is similarly bound to 128, irrespective of the
# order of the arguments in the subroutine call.
#
# These named parameters are especially useful when the number of arguments is
# large. For example, we haven’t covered object-oriented programming yet (see Chap‐
# ter 12), but this is how we could create an object of the (user-defined) Rectangle
# class:

# my $rect = Rectangle.new(
#     origin_x => 100,
#     origin_y => 200,
#     width => 23,
#     length => 42,
#     color => 'black'
# );

# Clearly, using five positional parameters would be unpractical.
#
# Optional Parameters
#
# Sometimes, the actual number of arguments is not known in advance: for example, a
# subroutine may be called with a variable number of arguments. Such a subroutine is
# said to be variadic. You can define a parameter to be optional by postfixing it with a
# question mark in the subroutine signature:

say 'B:';
sub my-sub($x, $y?) { # simple optional parameter
    if $y.defined {
        say "The second parameter has been supplied and defined";
    } else {
        say "The second parameter has not been supplied";
    }
    # ...
}
my-sub 4, 5;

# When using positional parameters, the optional parameters always have to be the last
# ones in the list (after the mandatory ones).
#
# A parameter can also be made optional by supplying a default value:

say 'C:';
sub my-log($number, $base = e) {
    # e is a predefined constant, $base is an optional parameter
    return log($number) / log($base);
}
say my-log(4); # Natural log (base e)
# -> 1.38629436111989
say my-log(32, 2); # Log base 2
# -> 5
say my-log(100, 10); # Common log (base 10)
# -> 2

# Here, if the second argument is not supplied, the default value (e) is used instead.
# Conversely, if there is a second argument, it overrides the default value.
#
# Sometimes, having optional or default parameters is not good enough. For example,
# the subroutine may have to process a list containing any number of values. For situa‐
# tions like this, you can use a slurpy parameter, i.e., a kind of array placed at the end of
# the parameter list that will slurp up all the remaining arguments. This kind of slurpy
# parameter uses the “*@” twigil. In the following example, the subroutine takes one
# mandatory parameter (the first number of the list) and a list of additional arguments
# that will be stored in the @rest array:

say 'D:';
sub my-sum($first-num, *@rest) {
    say @rest; # -> [3 4 5 12 17]
    return $first-num + [+] @rest;
}
say my-sum 1, 3, 4, 5, 12, 17; # -> 42

# Some further examples of slurpy parameters have been provided in “Exercise: Imple‐
# menting a Queue” on page 379.

