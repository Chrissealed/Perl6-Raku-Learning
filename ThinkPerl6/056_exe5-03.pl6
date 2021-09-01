#!/usr/bin/env perl6
#
# Exercise 5-3.
# A palindrome is a word that is spelled the same backward and forward, like “noon”
# and “redivider.” Recursively, a word is a palindrome if the first and last letters are the
# same and the middle is a palindrome.
# The following are subroutines that take a string argument and return the first, last,
# and middle letters:
# sub first_l(Str $word){
# return substr $word, 0, 1;
# }
# sub last_l(Str $word){
# return substr $word, *-1, 1;
# }
# sub middle_l(Str $word){
# return substr $word, 1, *-1;
# }
# Don’t worry about how they work for the time being; we will see that in Chapter 7 on
# strings. For now:
# 1. Type these subroutines into a file named palindrome.pl6 and test them out.
# What happens if you call middle_l with a string with two letters? One letter?
# What about the empty string, which is written '' and contains no letters? Given
# that the .chars method returns the length of a string, how could you add a signa‐
# ture constraint to reject invalid input?
# 2. Write a subroutine called is-palindrome that takes a string argument and
# returns True if it is a palindrome and False otherwise. Remember that you can
# use the built-in method .chars to check the length of a string.
# Solution: “Exercise 5-3: Palindromes” on page 358.

