#!/usr/bin/env perl6
#
# Using Regexes
#
# A simple way to use a regex is to use the smart match operator ~~ :

say "Matched" if "abcdef" ~~ / bc.e /;
# -> Matched

# Here, the smart match operator compares the “abcdef ” string with the /bc . e/ pattern
# and report a success, since, in this case, the “bc” in the string matches the bc part of
# the pattern, the dot in the pattern matches any character in the string (and matches in
# this case d) and, finally, the e of the string matches the e in the pattern.
# The part of the string that was matched is contained in the $/ variable representing
# the match object, which we can stringify with the ~ operator. We can make good use
# of this to better visualize the part of the string that was matched by the regex pattern:

say ~$/ if "abcdef" ~~ / bc.e /;
# -> bcde

# The matching process might be described as follows (but please note that this is a
# rough simplification): look in the string (from left to right) for a character matching
# the first atom (i.e., the first matchable item) of the pattern; when found, see whether
# the second character can match the second atom of the pattern, and so on. If the
# entire pattern is used, then the regex is successful. If it fails during the process, start
# again from the position immediately after the initial match point. (This is called back‐
# tracking.) And repeat that until one of the following occurs:
#
# • There is a successful match, in which case the process ends and success is
# reported.
# • The string has been exhausted without finding a match, in which case the regex
# failed.
#
# Let us examine an example of backtracking:

say "Matched" if "abcabcdef" ~~ / bc.e /;
# -> Matched

# Here, the regex engine starts by matching “bca” with bc ., but that initial match
# attempt fails, because the next letter in the string, “b”, does not match the “e” of the
# pattern. The regex engine backtracks and starts the search again from the third letter
# (“c”) of the string. It starts a new match on the fifth letter of the string (the second
# “b”), manages to match successfully “bcde”, and exits with a successful status (without
# even looking for any further match).
#
# If the string to be analyzed is contained in the $_ topical variable, then the smart
# match operator is implicit and the syntax is even simpler:

for 'abcdef' {
    say "Matched" if / cd.f /;
}
# $_ now contains 'abcdef'
# -> Matched

# You might also use a method invocation syntax:

say "Matched" if "abcdef".match(/ b.d.f /); # -> Matched

# In all cases we have seen so far, we directly used a pattern within a pair of / slash
# delimiters. We can use other delimiters if we prefix our pattern with the letter “m”:

say "Matched" if "abcdef" ~~ m{ bc.e }; # -> Matched
say "Matched" if "abcdef" ~~ m! bc.e !; # -> Matched
# or:
# The “m” operator does not alter the way a regex works; it only makes it possible to use
# delimiters other than slashes. Said differently, the “m” prefix is the standard way to
# introduce a pattern, but it is implicit and can be omitted when the pattern is delimi‐
# ted with slashes. It is probably best to use slashes (because that’s what people com‐
# monly use and immediately recognize), and to use other delimiters only when the
# regex pattern itself contains slashes.
#
# A pattern may also be stored in a variable (or, more accurately, in a regex object),
# using the rx// operator:

my $regex = rx/c..f/;
say "Matched" if 'abcdef' ~~ $regex;
# -> Matched

