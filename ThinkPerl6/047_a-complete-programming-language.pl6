#!/usr/bin/env perl6
#
# A Complete Programming Language
#
# We’ve seen in the section above several ways of writing a subroutine to check the
# divisibility of two integers.
# In fact, Perl 6 has a “is divisible” operator, %%, which returns True if the number on
# the left is divisible by the one on the right:

say 9 %% 3;
# True
say 9 %% 4;
# False

# So there was no need to write the is-divisible subroutine. But don’t worry, that’s
# alright if you did not know that. Speakers of natural languages are allowed to have
# different skill levels, to learn as they go and to put the language to good use before
# they know the whole language. The same is true with Perl. You (and I) don’t know all
# about Perl 6 yet, just as we don’t know all of English. But it is in fact “Officially Okay
# in Perl Culture” to use the subset of the language that you know. You are in fact
# encouraged to use what is sometimes called “baby Perl” to write programs, even if
# they are somewhat clumsy at the beginning. That’s the best way of learning Perl, just
# as using “baby talk” is the right way for a child to learn English.
# The number of different ways of accomplishing a given task, such as checking
# whether one number is divisible by another, is an example of one of Perl’s mottos:
# there is more than one way to do it, oft abbreviated TIMTOWTDI. Some ways may be
# more concise or more efficient than others, but, in the Perl philosophy, you are per‐
# fectly entitled to do it your way, especially if you’re a beginner, provided you find the
# correct result.
#
# We have only covered a small subset of Perl 6 so far, but you might be interested to
# know that this subset is a complete programming language, which means that essen‐
# tially anything that can be computed can be expressed in this language. Any program
# ever written could be rewritten using only the language features you have learned so
# far (actually, you would need a few commands to control devices like the mouse,
# disks, networks, etc., but that’s all).
#
# Proving that claim is a nontrivial exercise first accomplished by Alan Turing, one of
# the first computer scientists (some would argue that he was a mathematician, but a
# lot of early computer scientists started as mathematicians). Accordingly, it is known
# as the Turing Thesis. For a more complete (and accurate) discussion of the Turing
# Thesis, I recommend Michael Sipser’s book Introduction to the Theory of Computation
# (Cengage Learning).

