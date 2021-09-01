#!/usr/bin/env perl6
#
# Exercise 6-2.
# The mathematician Srinivasa Ramanujan found an infinite series that can be used to
# generate a numerical approximation of 1/π :
# 1
# /
# π
# 2 sqrt 2
# /
# 9801 k = 0_∑^∞
# (4k) ! (1103 + 26390k)
# /
# (k!)^4 396^4k
#
# Write a function called estimate-pi that uses this formula to compute and return an
# estimate of π. It should use a while loop to compute terms of the summation until the
# last term is smaller than 1e-15 (which is Perl notation for 10 −15 ). You can check the
# result by comparing it to the built-in constant pi . Solution: “Exercise 6-2: Pi Esti‐
# mate” on page 364.

