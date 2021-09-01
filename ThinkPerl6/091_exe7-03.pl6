#!/usr/bin/env perl6
#
# Exercise 7-3.
# A Caesar cipher is a weak form of encryption that involves “rotating” each letter by a
# fixed number of places. To rotate a letter means to shift it through the alphabet, wrap‐
# ping around to the beginning if necessary, so “A” rotated by 3 is “D” and “Z” rotated
# by 1 is “A”.
# To rotate a word, rotate each letter by the same amount. For example, “cheer” rotated
# by 7 is “jolly” and “melon” rotated by –10 is “cubed.” In the movie 2001: A Space
# Odyssey, the ship’s computer is called HAL, which is IBM rotated by –1.
# Write a function called rotate-word that takes a string and an integer as parameters,
# and returns a new string that contains the letters from the original string rotated by
# the given amount.
# You might want to use the built-in functions ord , which converts a character to a
# numeric code (Unicode code point), and chr , which converts such numeric codes
# back to characters:
# > say 'c'.ord;
# 99
# > say chr 99
# c
# Letters of the alphabet are encoded in alphabetical order, so for example:
#
# > ord('c') - ord('a')
# 2
# because 'c' is the second letter after 'a' in the alphabet. But beware: the numeric
# codes for uppercase letters are different.
# Potentially offensive jokes on the internet are sometimes encoded in ROT13, which is
# a Caesar cipher with rotation 13. Since 13 is half the number of letters in our alpha‐
# bet, applying rotation 13 twice returns the original word, so that the same procedure
# can be used for both encoding and decoding in rotation 13. If you are not easily
# offended, find and decode some of these jokes. (ROT13 is also used for other pur‐
# poses, such as weakly hiding the solution to a puzzle.) Solution: “Exercise 7-3: Cae‐
# sar’s Cipher” on page 375.

