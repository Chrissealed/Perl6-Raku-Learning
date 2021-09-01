#!/usr/bin/env perl6
#
# Exercise 9-10.
# To check whether a word is in our standard word list, you could check each element
# in turn, but it would be slow because it searches through the words in order.
# If the words are in alphabetical order (which is the case of our word list), we can
# speed things up considerably with a bisection search (also known as binary search),
# which is similar to what you do when you look a word up in the dictionary. You start
# somewhere in the middle and check to see whether the word you are looking for
# comes before the word in the middle of the list. If so, you search the first half of the
# list the same way. Otherwise, you search the second half.
# Either way, you cut the remaining search space in half. If the word list has 113,809
# words, it will take at most about 17 steps to find the word or conclude that it’s not
# there.
# Write a function called bisect that takes a sorted list and a target value and returns
# information about whether the target value is in the list or not.
# Solution: “Exercise 9-10: Bisection Search in a List” on page 394.

