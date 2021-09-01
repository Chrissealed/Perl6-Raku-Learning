#!/usr/bin/env perl6
#
# Regular Expressions (Regexes)
#
# The string functions and methods we have seen so far are quite powerful, and can be
# used for a number of string manipulation operations. But suppose you want to
# extract from the string “yellow submarine” any letter that is immediately preceded by
# the letter “l” and followed by the letter “w”. This kind of “fuzzy search” can be done in
# a loop, but this is somewhat unpractical. You may try to do it as an exercise if you
# wish, but you should be warned: it is quite tricky and difficult. Even if you don’t do it,
# the solution may be of some interest to you: see “Exercise: Simulating a Regex with a
# Loop” on page 367.
#
# If you add some further condition, for example that this letter should be captured
# (i.e., saved for later use) only if the rest of the string contains the substring “rin”, this
# starts to be really tedious. Also, any change to the requirements leads to a substantial
# rewrite or even complete refactoring of the code.
# For this type of work, regular expressions or regexes are a much more powerful and
# expressive tool. Here’s one way to extract letters using the criteria described above:

my $string = "yellow submarine";
# yellow submarine
say ~$0 if $string ~~ / l (.) w .*? rin /;
# o

# Don’t worry if you don’t understand this example; hopefully it will be clear very soon.
# The ~~ operator is called the smart match operator. It is a very powerful relational
# operator that can be used for many advanced comparison tasks. In this case, it checks
# whether the $string variable on its left “matches” the funny expression on its right,
# i.e., as a first approximation, whether the expression on the right describes the string
# (or part of it).
# The / l (.) w .*? rin / part is called a regex pattern and means: the letter “l”,
# followed by any single character (the dot) to be captured (thanks to the parentheses),
# followed by the letter “w”, followed by an unspecified number of characters, followed
# by the substring “rin”. Phew! All this in one single code line! Quite powerful, isn’t it? If
# the string matches the pattern, then the match will return a true value and $0 will be
# populated with the character to be captured—the letter “o” in this case.
# Unless specified otherwise (we will see more detail later), whitespace is not significant
# within a regex pattern. You can add spaces within a pattern to separate its pieces and
# make your intentions clearer.
#
# Most of the rest of this chapter will cover the basics of constructing such regex pat‐
# terns and using them. But the concept of regexes is so crucial in Perl that we will also
# devote a full chapter to this subject and some related matters (Chapter 13).
# The notion of regular expressions is originally a concept stemming from the theory
# of formal languages. The first uses of regular expressions in computing came from
# Unix utilities, some of which are still in wide use today, such as grep, created by Ken
# Thomson in 1973, sed (ca. 1974), and awk , developed a few years later (in 1977) by
# Aho, Weinberger, and Kernighan. Earlier versions of the Perl language in the 1980s
# included an extended version of regular expressions that has since been imitated by
# many other recent languages. The difference, though, is that regular expressions are
# deeply rooted within the core of the Perl language, whereas most other languages
# have adopted them as an add-on or a plug-in, often based or derived on a library
# known as Perl Compatible Regular Expressions (PCRE).
#
# The Perl regular expressions have extended these notions so much that they have lit‐
# tle to do with the original language theory concept, so that it has been deemed appro‐
# priate to stop calling them regular expressions and to speak about regexes, i.e., a sort of
# sublanguage that works similarly to regular expressions.

