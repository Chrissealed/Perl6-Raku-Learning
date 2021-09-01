#!/usr/bin/env perl6
#
# Global Variables
#
# In the previous example, %known is created outside the subroutine, so it belongs to the
# whole main package. Such variables are sometimes called global because they can be
# accessed from any function. Unlike “local” lexical variables, which usually disappear
# when their scope ends, global variables persist from one subroutine call to the next.
# It is common to use global variables for flags; that is, Boolean variables that indicate
# (“flag”) whether a condition is true. For example, some programs use a flag named
# $verbose to control the level of detail in the output:

say 'A:';
my $verbose = True;
sub example1 {
    say 'Running example1' if $verbose;
    # ...
}

example1();

# Global variables are also sometimes used for environment variables and parameters
# passed to the program, as well as for storing a large data structure that is the center‐
# piece of a program, in order to avoid copying it when passing it around as an argu‐
# ment to subroutines.
#
# But, aside from those specific cases, it is usually considered poor practice to use a
# global variable, because it creates dependencies and unexpected “action-at-a-
# distance” behaviors between various parts of a program and may lead to difficult-to-
# track bugs.
#
# In the case of our memoized fibonacci subroutine, the %known hash is useful only
# within the subroutine. We can improve the implementation by using the state
# declarator within the subroutine:

say 'B:';
say fibonacci(10);
sub fibonacci ($n) {
    state %known = 0 => 1, 1 => 1;
    return %known{$n} if %known{$n}:exists;
    %known{$n} = fibonacci($n-1) + fibonacci($n-2);
    return %known{$n};
}

# The state declarator makes the variable local to the subroutine and persistent from
# one call to the subroutine to another: the code line with the state statement is exe‐
# cuted only once (at the first call of the subroutine) and the content of the variable (the
# %known hash in this case) is kept from one call to the next.

