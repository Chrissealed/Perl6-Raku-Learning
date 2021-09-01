#!/usr/bin/env perl6
#
# Exercise 5-2.
# The Ackermann function, A m, n , is defined as follows:
# A m, n =
# | # n +1 # if m = 0
# | A m − 1, 1 # if m > 0 and n = 0
# | A m − 1, A m, n − 1 # if m > 0 and n > 0
#
# See http://en.wikipedia.org/wiki/Ackermann_function. Write a subroutine named ack
# that evaluates the Ackermann function. Use your subroutine to evaluate ack(3, 4) ,
# which should be 125. What happens for larger values of m and n ? Solution: “Exercise
# 5-2: The Ackermann Function” on page 358.

