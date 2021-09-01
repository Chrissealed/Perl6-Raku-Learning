#!/usr/bin/env perl6
#
# Adverbs (a.k.a. Modifiers)
#
# Adverbs modify the way the regex engine works. They often have a long form and a
# shorthand form.
# For example, the :ignorecase (or :i) adverb tells the compiler to ignore the distinc‐
# tion between uppercase and lowercase:

say 'A:';
say so 'AB' ~~ /ab/;
# False
say so 'AB' ~~ /:i ab/;
# True

# The so built-in used here coerces its argument (i.e., the value returned by the regex
# match expression) into a Boolean value.
#
# If placed before the pattern, an adverb applies to the whole pattern:

say 'B:';
say so 'AB' ~~ m:i/ ab/;
# True

# The adverb may also be placed later in the pattern and affects in this case only the
# part of the regex that comes afterwards:

say 'C:';
say so 'AB' ~~ /a :i b/;
# False
say so 'aB' ~~ /a :i b/;
# True

# I said earlier that whitespace is usually not significant in regex patterns. The :sig
# space or :s adverb makes whitespace significant in a regex:

say 'D:';
say so 'ab' ~~ /a+ b/;
# True
say so 'ab' ~~ /:s a+ b/;
# False
say so 'ab' ~~ /:s a+b/;
# True

# Instead of searching for just one match and returning a match object, the :global
# or :g adverb tells the compiler to search for every nonoverlapping match and return
# them in a list:

say 'E:';
say "Word count = ", $/.elems if "I have a dream" ~~ m:g/ \w+/;
# Word count = 4
say ~$/[3];
# dream

# These are the most commonly used adverbs. Another adverb, :ratchet or :r, tells
# the regex engine not to backtrack and is very important for some specific uses, but we
# will come back to it in a later chapter.

