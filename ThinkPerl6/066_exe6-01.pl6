#!/usr/bin/env perl6
#
# Exercise 6-1.
# Copy the loop from “Square Roots” on page 104 and encapsulate it in a subroutine
# called my-sqrt that takes $a as a parameter, chooses a reasonable value of $x , and
# returns an estimate of the square root of $a .
# To test it, write a function named test-square-root that prints a table like this:
#
# a mysqrt(a)
# sqrt(a)
# diff
# 1 1.0000000000000 1.0000000000000 1.110223e-15
# 2 1.4142135623747 1.4142135623731 1.594724e-12
# 3 1.7320508075689 1.7320508075689 0.000000e+00
# 4 2.0000000000000 2.0000000000000 0.000000e+00
# 5 2.2360679774998 2.2360679774998 0.000000e+00
# 6 2.4494897427832 2.4494897427832 8.881784e-16
# 7 2.6457513110647 2.6457513110646 1.025846e-13
# 8 2.8284271247494 2.8284271247462 3.189449e-12
# 9 3.0000000000000 3.0000000000000 0.000000e+00
#
# The first column is a number, a; the second column is the square root of a computed
# with my-sqrt ; the third column is the square root computed by the sqrt built-in
# function of Perl; and the fourth column is the absolute value of the difference
# between the two estimates. Don’t worry too much about obtaining clean tabular for‐
# matting; we haven’t seen the built-in functions to do that. Solution: “Exercise 6-1:
# Square Root” on page 363.

