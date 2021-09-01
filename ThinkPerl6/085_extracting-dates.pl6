#!/usr/bin/env perl6
#
# Extracting Dates
#
# Assume we have a string containing somewhere a date in the YYYY-MM-DD format.

my $string = "Christmas : 2016-12-25.";

# As mentioned earlier, one of the mottos in Perl is, “There is more than one way to do
# it” (TIMTOWTDI). The various examples below should illustrate that principle quite
# well by showing several different ways to retrieve the date in the string:
#
# • Using a character class (digits and dash):

say 'A:';
say ~$0 if $string ~~ /(<[\d-]>+)/;
# # -> 2016-12-25

# • Using a character class and a quantifier to avoid matching some small numbers
# elsewhere in the string if any:

say 'B:';
say ~$0 if $string ~~ /(<[\d-]> ** 10)/;
# -> 2016-12-25

# • Using a more detailed description of the date format:

say 'C:';
say ~$/ if $string ~~ /(\d ** 4 \- \d\d \- \d\d)/;

# • The same regex, but using an additional grouping to avoid repetition of the \-
# \d\d subpattern:

say 'D:';
say ~$/[0] if $string ~~ /(\d ** 4 [\- \d\d] ** 2 )/;

# • Capturing the individual elements of the date:

say 'E:';
$string ~~ /(\d ** 4) \- (\d\d) \- (\d\d)/;
my ($year, $month, $day) = ~$0, ~$1, ~$2;
say "$year $month $day";

# Note that using the tilde as a prefix above leads $year, $month, and $day to be
# populated with strings. Assuming you want these variables to contain integers
# instead, you might numify them, i.e., coerce them to numeric values using the
# prefix + operator:

say 'F:';
$string ~~ /(\d ** 4) \- (\d\d) \- (\d\d)/;
($year, $month, $day) = +$0, +$1, +$2;
say "$year $month $day";

# • Using subpatterns as building blocks:

say 'G:';
my $y = rx/\d ** 4/;
my $m = rx/\d ** 2/;
my $d = rx/\d ** 2/;
$string ~~ /(<$y>) \- (<$m>) \- (<$d>)/;
($year, $month, $day) = ~$0, ~$1, ~$2;
say "$year $month $day";

# Using subpatterns as building blocks is a quite efficient way of constructing step-
# by-step complicated regexes, but we will see in Chapter 13 even better ways of
# doing this type of thing.

# • We could improve the $m (month) subpattern so that it matches only “01” to “12”
# and thus verify that it matches a valid month number:

say 'H:';
$m = rx {   1 <[0..2]> # 10 to 12
         || 0 <[1..9]> # 01 to 09
        };
$string ~~ /($m)/;
my $match = ~$0;
say $match;

# As you can see, using comments and whitespace helps make the regex’s intent
# clearer.
#
# Another way of achieving the same goal is to use a code assertion to check that
# the value is numerically between 1 and 12:

say 'I:';
$m = rx /\d ** 2 <?{ 1 <= $/ <= 12 }> /;
$string ~~ /($m)/;
$match = ~$0;
say $match;

# As an exercise, you could try to validate that the $d (day) subpattern falls within
# the 01 to 31 range. Try to use both validation techniques outlined just above.
# The $/ match object has the prematch and postmatch methods for extracting what
# comes before and after the matched part of the string:

say 'J:';
$string ~~ /(\d ** 4) \- (\d\d) \- (\d\d)/;
say $/.prematch;
# -> "Christmas : "
say $/.postmatch;
# -> "."
#
# As an exercise, try to adapt the above regexes for various other date formats (such as
# DD/MM/YYYY or YYYY MM, DD) and test them. If you’re trying with the
# YYYY, MM, DD format, please remember that spaces are usually not significant in a
# regex pattern, so you may need either to specify explicit spaces (using for example the
# \s character class) or the :s adverb to make whitespace significant.

