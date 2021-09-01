#!/usr/bin/env perl6
#
# Multi Subroutines
#
# It is possible to write multiple versions of a subroutine with the same name but with
# different signatures, for example a different arity (a fancy word for the number of
# arguments) or different argument types, using the multi keyword. In this case, the
# interpreter will pick the version of the subroutine whose signature matches (or best
# matches) the argument list.
# For example, we could rewrite the factorial function as follows:

multi sub fact(0) { 1 }
multi sub fact(Int $n where $n > 0) {
    $n * fact $n - 1;
}

say fact 0;
# -> 1
say fact 10; # -> 3628800

# Here, we don’t enter into infinite recursion because, when the parameter passed to
# fact is 0, it is the first version of the multi subroutine that is called and it returns an
# integer value (1), and this ends the recursion.
# Similarly, the Fibonacci function can be rewritten with multi subroutines:

multi fibonacci(0) { 0 }
multi fibonacci(1) { 1 }
multi fibonacci(Int $n where $n > 1) {
    fibonacci($n - 2) + fibonacci($n - 1)
}

say fibonacci 10; # -> 55

# Many built-in functions and most operators of Perl 6 are written as multi
# subroutines.

