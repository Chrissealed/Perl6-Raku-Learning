#!/usr/bin/env perl6
#
# Exercise 3-3.
# Note: this exercise should be done using only the statements and other features we
# have learned so far.
# 1. Write a subroutine that draws a grid like the following:
# + - - - - + - - - - +
# |         |         |
# |         |         |
# |         |         |
# |         |         |
# + - - - - + - - - - +
# |         |         |
# |         |         |
# |         |         |
# |         |         |
# + - - - - + - - - - +
#
# Hint: to print more than one value on a line, you can print a comma-separated
# sequence of values:
# say '+', '-';
# The say function prints its arguments with a newline at the end (it advances to
# the next line). If you don’t want to go to the next line, use the print function
# instead:
# print '+', ' ';
# print '-';
# The output of these statements is “+ -”.
# A say statement with an empty string argument ends the current line and goes to
# the next line.
# 2. Write a subroutine that draws a similar grid with four rows and four columns.
# Solution: “Exercise 3-3: Subroutine print-grid” on page 348.
# Credit: this exercise is based on an exercise in Practical C Programming, 3rd Edition,
# by Steve Oualline (O’Reilly, 1997).

