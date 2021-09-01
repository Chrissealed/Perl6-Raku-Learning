#!/usr/bin/env perl6
#
# Quantifiers
#
# A quantifier makes a preceding atom^1 match not exactly once, but rather a specified
# or variable number of times. For example, a+ matches one or more “a” characters. In
# the following code, the \d+ matches one or more digits (three digits in this case):

# 1) The word atom means a single character, or several characters or other atoms,
# grouped together with a set of parentheses or square brackets.

say ~$/ if 'Bond 007' ~~ /\w\D\s\d\+/;
# -> "nd 007"
#
# The predefined quantifiers include:
#
# • +: one or more times
# • *: zero or more times
# • ?: zero or one match
#
# The + and * quantifiers are said to be greedy, which means that they match as many
# characters as they can. For example:

say ~$/ if 'aabaababa' ~~ / .+ b /;
# -> aabaabab

# Here, the .+ matches as much as it possibly can of the string, while still being able to
# match the final “b”. This is often what you want, but not always. Perhaps your inten‐
# tion was to match all letters until the first “b”. In such cases, you would use the frugal
# (nongreedy) versions of those quantifiers, which are obtained by suffixing them with
# a question mark: +? and *?. A frugal quantifier will match as much as it has to for the
# overall regex to succeed, but not more than that. To match all letters until the first b,
# you could use:

say ~$/ if 'aabaababa' ~~ / .+? b /;
# -> aab

# You can also specify a range ( min..max ) for the number of times an atom may be
# matched. For example, to match an integer smaller than 1,000:

my $string = '134';
say 'Is a number < 1,000' if $string ~~ / ^ \d ** 1..3 $ /;

# This matches one to three digits. The ^ and $ characters are anchors representing the
# beginning and the end of the string; they will be covered in the next section.
#
# For matching an exact number of times, just replace the range with a single number:

my $num = 134;
say 'Is a 3-digit number' if $num ~~ / ^ \d ** 3 $ /;

