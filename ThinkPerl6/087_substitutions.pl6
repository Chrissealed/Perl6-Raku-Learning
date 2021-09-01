#!/usr/bin/env perl6
#
# Substitutions
#
# Replacing part of a string with some other substring is a very frequent requirement in
# string handling. This might be needed for spelling corrections, data reformatting,
# removal of personal information from data, etc.
#
# The subst Method
#
# Perl has a subst method which can replace some text with some other text:

say 'A:';
my $string = "abcdefg";
$string = $string.subst("cd", "DC");
say $string;
# -> abDCefg

# The first argument to this method is the search part, and can be a literal string, as in
# the example above, or a regex:

say 'B:';
$string = "abcdefg";
$string = $string.subst(/c \w+ f/, "SUBST");
say $string;
# -> abSUBSTg

# The s/search/replace/ Construct
#
# The most common way to perform text substitution in Perl is the s/search/replace
# construct, which is quite concise, plays well within the general regex syntax, and has
# the advantage of enabling in-place substitution.
#
# This is an example of the standard syntax for this type of substitution:

say 'C:';
$string = "abcdefg";
$string ~~ s/ c \w+ f /SUBST/;
say $string;
# -> abSUBSTg

# Here, the search part is a regex and the replacement part is a simple string (no quota‐
# tion marks needed).
#
# If the string is contained in the $_ topical variable, you don’t need to use the smart‐
# match operator:

say 'D:';
$_ = "abcdefg";
s/c \w+ f/SUBST/;
say $_;
# -> abSUBSTg

# The delimiters don’t need to be slashes (and this can be quite useful if either the
# search or the replacement contain slashes):

say 'E:';
my $str = "<c>foo</c> <a>foo</a>";
$str ~~ s!'<a>foo</a>'!<a>bar</a>!;
say $str;
# -> <c>foo</c> <a>bar</a>

# Unless specified otherwise (with an adverb), the substitution is done only once,
# which helps to prevent unexpected results:

say 'F:';
$_ = 'There can be twly two';
s/tw/on/; # Replace 'tw' with 'on' once
say $_;
# .say; # There can be only two

# If the substitution were done throughout the string, “two” would have been replaced
# by “ono”, clearly not the expected result.
#
# Using Captures
#
# If the regex on the lefthand side contains captures, the replacement part on the right‐
# hand side can use the $O, $1, and $2 variables on the right side to insert captured sub‐
# strings in the replacement text. A typical example of that is date reformatting:

say 'G:';
$string = "Xmas = 2016-12-25";
$string ~~ s/(\d ** 4) \- (\d\d) \- (\d\d)/$2-$1-$0/;
say $string;
# $string is now: Xmas = 25-12-2016

# Adverbs
#
# The adverbs discussed above (“Adverbs (a.k.a. Modifiers)” on page 125) can be used
# with the substitution operator.
# The modifiers most commonly used in substitutions are the :ignorecase (or :i)
# and :global (or :g) adverbs. They work just as described when we were discussing
# regexes and matching in “Adverbs (a.k.a. Modifiers)” on page 125.
# The one specific point to be made here is that substitutions are usually done only
# once. But with the :global (or :g ) adverb, they will be done throughout the whole
# string:

say 'H:';
$string = "foo bar bar foo bar";
$string ~~ s:g/bar/baz/; # string is now "foo baz baz foo baz"
say $string;

