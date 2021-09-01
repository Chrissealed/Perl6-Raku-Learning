#!/usr/bin/env perl6
#
# Anchors and Assertions
#
# Sometimes, matching a substring is not good enough; you want to match the whole
# string, or you want the match to occur at the beginning or at the end of the string, or
# at some other specific place within the string. Anchors and assertions make it possi‐
# ble to specify where the match should occur. They need to match successfully in
# order for the whole regex to succeed, but they do not use up characters while
# matching.
#
# Anchors
#
# The most commonly used anchors are the ^ start of string and $ end of string
# anchors:

say 'A:';
my $string = "superlative";
say "$string starts with 'perl'" if $string ~~ /^perl/; # (No output)
say "$string ends with 'perl'" if $string ~~ /perl$/; # (No output)
say "$string # equals 'perl'" if $string ~~ /^perl$/; # (No output)

# All three regexes fail because, even though $string contains the “perl” substring, the
# substring is neither at the start, nor at the end of the string.
#
# In the event that you are handling multiline strings, you might also use the ^^ start of
# line and $$ end of line anchors.
#
# There are some other useful anchors, such as the << start of word (or word left
# boundary) and >> end of word (or word right boundary) anchors.
#
# Look-around assertions
#
# Look-around assertions make it possible to specify more complex rules: for example,
# match “foo”, but only if preceded (or followed) by “bar” (or not preceded or not fol‐
# lowed by “bar”):

say 'B:';
say "foobar" ~~ /foo <?before bar>/; # -> foo (lookahead assertion)
say "foobaz" ~~ /foo <?before bar>/; # -> Nil (regex failed)
say "foobar" ~~ /<?after foo> bar/; # -> bar (lookbehind assertion)

# Using an exclamation mark instead of a question mark transforms these look-around
# assertion into negative assertions. For example:

say 'C:';
say "foobar" ~~ /foo <!before baz>/; # -> foo
say "foobar" ~~ /<!after foo> bar/; # -> Nil (regex failed)

# I assume that the examples above are rather clear; look into the documentation if you
# need further details.
#
# Code assertions
#
# You can also include a code assertion <?{...}> , which will match if the code block
# returns a true value:

say 'D:';
say ~$/ if /\d\d <?{$/ == 42}>/ for <A12 B34 C42 D50>;
# 42

# A negative code assertion <!{...}> will match unless the code block returns a true
# value:

say ~$/ if /\d\d <!{$/ == 42}>/ for <A12 B34 C42 D50>;
# 12
# 34
# 50

# Code assertions are useful to specify conditions that cannot easily be expressed as
# regexes.
#
# They can also be used to display something, for example for the purpose of debug‐
# ging a regex by printing out information about partial matches:

say 'E:';
say "Matched $/" if "A12B34D50" ~~ /(\D) <?{ say ~$0}> \d\d$/;
# A
# B
# D
# Matched D50

# The output shows the various attempted matches that failed (“A” and “B”) before the
# backtracking process ultimately led to success (“D50” at the end of the string).
# However, code assertions are in fact rarely needed for such simple cases, because you
# can very often just add a simple code block for the same purpose:

say "Matched $/" if "A12B34D50" ~~ /(\D) { say ~$0} \d\d$/;

# This code produces the same output, and there is no need to worry about whether the
# block returns a true value.

