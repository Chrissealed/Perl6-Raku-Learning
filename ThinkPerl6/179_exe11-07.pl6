#!/usr/bin/env perl6
#
# Exercise 11-7.
# Markov analysis:
# 1. Write a program to read a text from a file and perform Markov analysis. The
# result should be a hash that maps from prefixes to a collection of possible suf‐
# fixes. The collection might be an array, a hash, a set, a bag, etc.; it is up to you to
# make an appropriate choice. You can test your program with prefix length two,
# but it would be nice to write the program in a way that makes it easy to try other
# lengths.
# 2. Add a function to the previous program to generate random text based on the
# Markov analysis. Here is an example from Emma with prefix length 2:
# it was a black morning’s work for her. the friends from whom she could not have
# come to hartfield any more! dear affectionate creature! you banished to abbey mill
# farm. now i am afraid you are a great deal happier if she had no hesitation in
# approving. dear harriet, i give myself joy of so sorrowful an event;
#
# For this example, the punctuation has been left attached to the words. The result
# is almost syntactically correct, but not quite. Semantically, it almost makes sense,
# but not quite.
# What happens if you increase the prefix length? Does the random text make
# more sense?
# 3. Once your program is working, you might want to try a mash-up: if you combine
# text from two or more books, the random text you generate will blend the
# vocabulary and phrases from the sources in interesting ways.
# Credit: this case study is based on an example from Kernighan and Pike, The Practice
# of Programming, Addison-Wesley, 1999.
# You should attempt this exercise before you go on. Then you can can study our solu‐
# tion in “Exercise: Markov Analysis” on page 411.

