#!/usr/bin/env perl6
#
# Extracting an IP Address
#
# Assume we have a string containing an IP-v4 address somewhere. IP addresses are
# most often written in the dot-decimal notation, which consists of four octets of the
# address expressed individually in decimal numbers and separated by periods, for
# example 17.125.246.28.
# For the purpose of these examples, our sample target string will be as follows:

my $string = "IP address: 17.125.246.28;";

# Let’s now try a few different ways to capture the IP address in that string, in the same
# way as we just did for the dates:
#
# • Using a character class:

say 'A:';
say ~$0 if $string ~~ /(<[\d.]>+)/;
# -> 17.125.246.28

# • Using a character class and a quantifier (note that each octet may have 1 to 3 dig‐
# its, so the total number of characters may vary from 7 to 15):

say 'B:';
say ~$0 if $string ~~ /(<[\d.]> ** 7..15)/;

# • Using a more detailed description of the IP format:

say 'C:';
say ~$/ if $string ~~ /([\d ** 1..3 \.] ** 3 \d ** 1..3 )/;

# • Using subpatterns as building blocks:

say 'D:';
my $octet = rx/\d ** 1..3/;
say ~$/ if $string ~~ /([<$octet> \.] ** 3 <$octet>)/;

# • The maximal value of an octet is 255. We can refine somewhat the definition of
# the $octet subpattern:

say 'E:';
$octet = rx/<[1..2]>? \d ** 1..2/;
say ~$/ if $string ~~ /([<$octet> \.] ** 3 <$octet>)/;

# With this definition of the $octet pattern, the regex would match any number of
# one or two digits, or a three-digit number starting with digits 1 to 2.
#
# • But that is not good enough if we really want to check that the IP address is valid
# (for example, it would erroneously accept 276 as a valid octet). The definition of
# the $octet subpattern can be further refined to really match only authorized
# values:

say 'F:';
$octet = rx { (
                   25 <[0..5]>   # 250 to 255
                || 2 <[0..4]> \d # 200 to 249
                || 1 \d ** 2     # 100 to 199
                || \d ** 1..2    # 0 to 99
                 )
               };
say ~$/ if $string ~~ /([<$octet> \.] ** 3 <$octet>)/;

# This definition of $octet illustrates once more how the abundant use of white‐
# space and comments can help make the intent clearer.
#
# • We could also use a code assertion to limit the value of an $octet to the 0..255
# range:

say 'G:';
$octet = rx{(\d ** 1..3) <?{0 <= $0 <= 255 }> };
say ~$/ if $string ~~ /([<$octet> \.] ** 3 <$octet>)/;

