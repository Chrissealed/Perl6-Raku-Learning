#!/usr/bin/env perl6
#
# Building your Regex Patterns
#
# It is now time to study the basic building blocks of a regex pattern.
#
# Literal Matching
#
# As you have probably figured out by now, the simplest case of a regex pattern is a
# constant string. Matching a string against such a regex is more or less equivalent to
# searching for that string with the index function:

my $string = "superlative";
say "$string contains 'perl'." if $string ~~ /perl/;
# -> superlative contains 'perl'.

# Note however that, for such literal matches, the index function discussed earlier is
# likely to be slightly more efficient than a regex on large strings. The contains
# method, which returns True if its argument is a substring of its invocant, is also likely
# to be faster.
#
# Alphanumeric characters and the underscore (_) are literal matches. All other charac‐
# ters must either be escaped with a backslash (for example, \? to match a question
# mark), or included in quotes:

# say "Success" if 'name@company.uk' ~~ / name@co /; # Fails to compile
say "Success" if 'name@company.uk' ~~ / 'name@co' /; # # -> Success
say "Success" if 'name@company.uk' ~~ / name\@co/ ; # # -> Success
say "Success" if 'name@company.uk' ~~ / name '@' co /; # -> Success

