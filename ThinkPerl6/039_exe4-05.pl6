#!/usr/bin/env perl6
#
# Exercise 4-5.
# What is the output of the following program? Draw a stack diagram that shows the
# state of the program when it prints the result.
# sub recurse($n, $s) {
#     if ($n == 0) {
#         say $s;
#     } else {
#         recurse $n - 1, $n + $s;
#     }
# }
# recurse 3, 0;
# 1. What would happen if you called the function like this: recurse(-1, 0) ?
# 2. Write a documentation comment (maybe in the form of a multiline comment)
# that explains everything someone would need to know in order to use this func‐
# tion (and nothing else).
# Solution: “Exercise 4-5: The recurse Subroutine” on page 354.

