#!/usr/bin/env perl6
#
# Common String Operators
#
# Perl provides a number of operators and functions to handle strings. Let’s review
# some of the most popular ones.
#
# String Length
#
# The first thing we might want to know about a string is its length. The chars built-in
# returns the number of characters in a string and can be used with either a method or
# a function syntax:

say 'A:';
say "banana".chars; # method invocation syntax
# 6
say chars "banana"; # function call syntax
# 6

# Note that, with the advent of Unicode, the notion of string length has become more
# complicated than it used to be in the era of ASCII-only strings. Today, a character
# may be made of one, two, or more bytes. The chars routine returns the number of
# characters (in the sense of Unicode graphemes, which is more or less what humans
# perceive as characters) within the string, even if some of these characters require an
# encoding over 2, 3, or 4 bytes.
# A string with a length of zero (i.e., no characters) is called an empty string.
#
# Searching for a Substring Within the String
#
# The index built-in usually takes two arguments, a string and a substring (sometimes
# called the “haystack” and the “needle”), searches for the substring in the string, and
# returns the position where the substring is found (or an undefined value if it is not
# found):

say 'B:';
say index "banana", "na";
# 2
say index "banana", "ni";
# Nil

# Here again, the index is an offset from the beginning of the string, so that the index of
# the first letter (“b”) is zero, and the offset of the first “n” is 2, not 3.
#
# You may also call index with a method syntax:

say "banana".index("na");
# 2

# The index function can take a third optional argument, an integer indicating where
# to start the search (thus ignoring in the search any characters before the start
# position):

say index "banana", "na", 3;
# 4

# Here, the index function started the search on the middle “a” and thus found the
# position of the second occurrence of the “na” substring.
#
# There is also a rindex function, which searches the string backwards from the end
# and returns the last position of the substring within the string:

say rindex "banana", "na";
# 4

# Note that even though the rindex function searches the string backwards (from the
# end), it returns a position computed from the start of the string.
#
# Extracting a Substring from a String
#
# The opposite of the index function is the substr function or method, which, given a
# start position and a length, extracts a substring from a string:

say 'C:';
say substr "I have a dream", 0, 6;
# I have
say "I have a dream".substr(9, 5);
# dream

# Note that, just as for the chars function, the length is expressed in characters (or Uni‐
# code graphemes), not in bytes. Also, as you can see, spaces separating words within
# the string obviously count as characters. The length argument is optional; if it is not
# provided, the substr function returns the substring starting on the start position to
# the end of the string:

say "I have a dream".substr(7);
# a dream

# Similarly, if the length value is too large for the substring starting on the start posi‐
# tion, the substr function will return the substring starting on the start position to the
# end of the string:

say substr "banana", 2, 10;
# nana

# Of course, the start position and length parameters need not be hardcoded numbers
# as in the examples above; you may use a variable instead (or even an expression or a
# function returning a numeric value), provided the variable or value can be coerced
# into an integer. But the start position must be within the string range, failing which
# you would obtain a Start argument to substr out of range ... error; so you
# may have to verify it against the length of the string beforehand.
#
# You can also start counting backwards from the end of the string with the following
# syntax:

say 'D:';
say "I have a dream".substr(*-5);
# dream
say substr "I have a dream", *-5;
# dream

# Here, the star (*) may be thought as representing the total size of the string; *-5 is
# therefore the position in the string five characters before the end of the string. So,
# substr(*-5) returns the characters from that position to the end of the string (i.e.,
# the last five characters of the string).
#
# A Few Other Useful String Functions or Methods
#
# This may not be obvious yet, but we will see soon that the combination of the above
# string functions gives you already a lot of power to manipulate strings way beyond
# what you may think possible at this point.
# Let us just mention very briefly a few additional functions that may prove useful at
# times.
#
# flip
#
# The flip function or method reverses a string:

say 'E:';
say flip "banana";
# ananab

# split
#
# The split function or method splits a string into substrings, based on delimiters
# found in the string:

say 'F:';
say $_ for split "-", "25-12-2016";
# 25
# 12
# 2016
for "25-12-2016".split("-") -> $val {say $val};
# 25
# 12
# 2016

# The delimiter can be a single quoted character as in the examples above or a string of
# several characters, such as a comma and a space in the example below:

.say for split ", ", "Jan, Feb, Mar";
# Jan
# Feb
# Mar

# Remember that .say is a shortcut for $_.say .
#
# By default, the delimiters don’t appear in the output produced by the split function
# or method, but this behavior can be changed with the use of an appropriate adverb.
# An adverb is basically a named argument to a function that modifies the way the
# function behaves. For example, the :v (values) adverb tells split to also output the
# value of the delimiters:

.perl.say for split ', ', "Jan, Feb, Mar", :v;
# "Jan"
# ", "
# "Feb"
# ", "
# "Mar"

# The other adverbs that can be used in this context are :k (keys), :kv (keys and val‐
# ues), and :p (pairs). Their detailed meaning can be found in the documentation for
# split. The skip-empty adverb removes empty chunks from the result list.
# The split function can also use a regular expression pattern as delimiter, and this
# can make it much more powerful. We will study regular expressions later in this
# chapter.
#
# String concatenation
#
# The ~ operator concatenates two strings into one:

say 'G:';
say "ban" ~ "ana";
# banana

# You may chain several occurrences of this operator to concatenate more than two
# strings:

say "ba" ~ "na" ~ "na";
# banana
#
# Used as a unary prefix operator, ~ “stringifies” (i.e., transforms into a string) its
# argument:

say 'H:';
say (~42).WHAT;
# (Str)

# Splitting on words
#
# The words function returns a list of words that make up the string:

say 'I:';
say "I have a dream".words.perl;
# ("I", "have", "a", "dream").Seq
.say for "I have a dream".words;
# I
# have
# a
# dream
#
# join
#
# The join function takes a separator argument and a list of strings as arguments; it
# interleaves them with the separator, concatenates everything into a single string, and
# returns the resulting string.
# This example illustrates the chained use of the words and join functions or methods:

say 'J:';
say 'I have a dream'.words.join('|');
# -> I|have|a|dream
say join ";", words "I have a dream";
# -> I;have;a;dream

# In both cases, words first splits the original string into a list of words, and join
# stitches the items of this list back into a new string interleaved with the separator.
#
# Changing the case
#
# The lc and uc routines return respectively a lowercase and an uppercase version of
# their arguments. There is also a tc function or method returning its argument with
# the first letter converted to title case or uppercase:

say 'K:';
say lc "April";
# april
say "April".lc;
# april
say uc "april";
# APRIL
say tc "april";
# April

# Remember also that the eq operator checks the equality of two strings.

