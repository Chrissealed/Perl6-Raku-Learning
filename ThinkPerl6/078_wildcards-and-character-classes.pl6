#!/usr/bin/env perl6
#
# Wildcards and Character Classes
#
# Regexes wouldn’t be very useful if they could only do literal matching. We are now
# getting to the more interesting parts.
# In a regex pattern, some symbols can match not a specific character, but a whole fam‐
# ily of characters, such as letters, digits, etc. They are called character classes.
# We have already seen that the dot is a sort of wildcard matching any single character
# of the target string:

my $string = "superlative";
say "$string contains 'pe.l'." if $string ~~ / pe . l /;
# -> superlative contains 'pe.l'.

# The example above illustrates another feature of regexes: whitespace is usually not
# significant within regex patterns (unless specified otherwise with the :s or :sigspace
# adverb, as we will see later).
#
# There are predefined character classes of the form \w. Its negation is written with an
# uppercase letter, \W. \w (“word character”) matches one single alphanumeric charac‐
# ter (i.e., among alphabetical characters, digits, and the _ character). \W will match any
# other character. Note however that Perl is Unicode-compliant and that, for example,
# letters of the Greek or Cyrillic alphabets or Thai digits will be matched by \w :

say "Matched" if 'abcδ' ~~ / ab\w\w /;
# -> Matched

# Here, the string was matched because, according to the Unicode standard, δ (Greek
# small letter delta) is a letter and it therefore belongs to the \w character class.
#
# Other common character classes include:
#
# • \d (digits) and \D (non-digits)
# • \s (whitespace) and \S (non-whitespace)
# • \n (newline) and \N (non-newline)

say ~$/ if 'Bond 007' ~~ /\w\D\s\d\d\d/;
# -> "nd 007"

# Here, we’ve matched “nd 007” because we have found one word character (n), fol‐
# lowed by a nondigit (“d”), followed by a space, followed by three digits.
#
# You can also specify your own character classes by inserting between <[ ]> any num‐
# ber of single characters and ranges of characters (expressed with two dots between
# the end points), with or without whitespace. For example, a character class for a hexa‐
# decimal digit might be:
#
# <[0..9 a..f A..F]>
#
# You can negate such a character class by inserting a “-” after the opening angle
# bracket. For example, a string is not a valid hexadecimal integer if it contains any
# character not in <[0..9a..fA..F]> , i.e., any character matched by the negated hexa‐
# decimal character class:

say "Not an hex number" if $string ~~ /<-[0..9 a..f A..F]>/;

# Please note that you generally don’t need to escape nonalphanumeric characters in
# your character classes:

say ~$/ if "-17.5" ~~ /(<[\d.-]>+)/; # -> -17.5

# In this example, we use the “+” quantifier that we’ll discuss in the next section, but
# the point here is that you don’t need to escape the dot and the dash within the charac‐
# ter class definition.

