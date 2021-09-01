#!/usr/bin/env perl6
#
# Grouping and Capturing
#
# Parentheses and square brackets can be used to group things together or to override
# precedence:
#
# / a || bc /
# # matches 'a' or 'bc'
# / ( a || b ) c / # matches 'ac' or 'bc'
# / [ a || b ] c / # Same: matches 'ac' or 'bc', non-capturing grouping
# / a b+ / # Matches an 'a' followed by one or more 'b's
# / # (a b)+ /
# Matches one or more sequences of 'ab'
# / [a b]+ /
# Matches one or more sequences of 'ab', non-capturing
# / (a || b)+ /
# Matches a sequence of 'a's and 'b's (at least one)
#
# The difference between parentheses and square brackets is that parentheses don’t just
# group things together, they also capture data: they make the string matched within
# the parentheses available as a special variable (and also as an element of the resulting
# match object):

my $str = 'number 42';
say "The number is $0" if $str ~~ /number\s+ (\d+) /;
# -> The number is 42

# Here, the pattern matched the $str string and the part of the pattern within paren‐
# theses was captured into the $0 special variable. Where there are several parenthe‐
# sized groups, they are captured into variables named $0, $1, $2, etc. (from left to
# right, counting the opening parentheses):

say "$0 $1 $2" if "abcde" ~~ /(a) b (c) d (e)/;
# -> a c e
# or:
say "$/[0..2]" if "abcde" ~~ /(a) b (c) d (e)/; # -> a c e

# The $0, $1, etc. variables are actually a shorthand for $/[0], $/[1], the first and sec‐
# ond items of the matched object in list context, so that printing "The number is $/
# [0]" would have had the same effect.
#
# As noted, the parentheses perform two roles in regexes: they group regex elements
# and they capture what is matched by the subregex within parentheses. If you want
# only the grouping behavior, use square brackets [...] instead:

say ~$0 if 'cacbcd' ~~ / [a||b] (c.) /;
# -> cb

# Using square brackets when there is no need to capture text has the advantage of not
# cluttering the $0, $1, $2, etc. variables, and it is likely to be slightly faster.

