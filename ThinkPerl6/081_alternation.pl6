#!/usr/bin/env perl6
#
# Alternation
#
# Alternations are used to match one of several alternatives.
# For example, to check whether a string represents one of the three base image colors
# (in JPEG and some other image formats), you might use:

my $string = 'green';
say 'Is a JPEG color' if $string ~~ /^ [ red | green | blue ] $/;

# There are two forms of alternations. First-match alternation uses the || operator and
# stops on the first alternative that matches the pattern:

say ~$/ if "abcdef" ~~ /ab || abcde/;
# -> ab

# Here, the pattern matches “ab”, without trying to match any further, although there
# would be an arguably “better” (i.e., longer) match with the other alternative. When
# using this type of alternation, you have to think carefully about the order in which
# you put the various alternatives, depending on what you need to do.
#
# The longest-match alternation uses the | operator and will try all the alternatives and
# match the longest one:

say ~$/ if "abcdef" ~~ /ab | abcde/;
# -> abcde

# Beware, though, that this will work as explained only if the alternative matches all
# start on the same position within the string:

say ~$/ if "abcdef" ~~ /ab | bcde/;
# -> ab
#
# Here, the match on the leftmost position wins (this is a general rule with regexes).

